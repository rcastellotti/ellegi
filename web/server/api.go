package server

import (
	"ellegi/reqid"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"regexp"
	"strings"
	"time"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"

	pb "ellegi/proto"
	"ellegi/server/log"

	"golang.org/x/net/context"
)

type InnerError struct {
	Code    string `json:"code"`
	Message string `json:"message"`
}

// ReplyError is returned along with any non-200 status reply
type ReplyError struct {
	Err InnerError `json:"error"`
}

// ReplySearch is returned to /api/v1/search/:backend
type ReplySearch struct {
	Info        *Stats        `json:"info"`
	Results     []*Result     `json:"results"`
	FileResults []*FileResult `json:"file_results"`
	SearchType  string        `json:"search_type"`
}

type Stats struct {
	RE2Time     int64  `json:"re2_time"`
	GitTime     int64  `json:"git_time"`
	SortTime    int64  `json:"sort_time"`
	IndexTime   int64  `json:"index_time"`
	AnalyzeTime int64  `json:"analyze_time"`
	TotalTime   int64  `json:"total_time"`
	ExitReason  string `json:"why"`
}

type Result struct {
	Tree          string   `json:"tree"`
	Version       string   `json:"version"`
	Path          string   `json:"path"`
	LineNumber    int      `json:"lno"`
	ContextBefore []string `json:"context_before"`
	ContextAfter  []string `json:"context_after"`
	Bounds        [2]int   `json:"bounds"`
	Line          string   `json:"line"`
}

type FileResult struct {
	Tree    string `json:"tree"`
	Version string `json:"version"`
	Path    string `json:"path"`
	Bounds  [2]int `json:"bounds"`
}

func replyJSON(ctx context.Context, w http.ResponseWriter, status int, obj interface{}) {
	w.WriteHeader(status)
	enc := json.NewEncoder(w)
	if err := enc.Encode(obj); err != nil {
		log.Printf(ctx, "writing http response, data=%s err=%q",
			asJSON{obj},
			err.Error())
	}
}

func writeError(ctx context.Context, w http.ResponseWriter, status int, code, message string) {
	log.Printf(ctx, "error status=%d code=%s message=%q",
		status, code, message)
	replyJSON(ctx, w, status, &ReplyError{Err: InnerError{Code: code, Message: message}})
}

func writeQueryError(ctx context.Context, w http.ResponseWriter, err error) {
	if code := grpc.Code(err); code == codes.InvalidArgument {
		writeError(ctx, w, 400, "query", grpc.ErrorDesc(err))
	} else {
		writeError(ctx, w, 500, "internal_error",
			fmt.Sprintf("Talking to backend: %s", err.Error()))
	}
}

func extractQuery(ctx context.Context, r *http.Request) (pb.Query, bool, error) {
	var query pb.Query

	if err := r.ParseForm(); err != nil {
		return query, false, err
	}

	params := r.Form
	var err error

	regex := true
	if re, ok := params["regex"]; ok && re[0] == "false" {
		regex = false
	}

	if q, ok := params["q"]; ok {
		query, err = ParseQuery(q[0], regex)
		log.Printf(ctx, "parsing query q=%q out=%s", q[0], asJSON{query})
	}

	// Support old-style query arguments
	if line, ok := params["line"]; ok {
		query.Line = line[0]
		if !regex {
			query.Line = regexp.QuoteMeta(query.Line)
		}
	}
	if file, ok := params["file"]; ok {
		query.File = []string{file[0]}
		if !regex {
			query.File = []string{regexp.QuoteMeta(file[0])}
		}
	}
	if files, ok := params["file"]; ok {
		query.File = files
		if !regex {
			query.File = make([]string, len(files))
			for _, f := range files {
				query.File = append(query.File, regexp.QuoteMeta(f))
			}
		}
	}
	if repo, ok := params["repo"]; ok {
		query.Repo = repo[0]
		if !regex {
			query.Repo = regexp.QuoteMeta(query.Repo)
		}
	}

	// New-style repo multiselect, only if "repo:" is not in the query.
	if len(query.Repo) == 0 {
		if newRepos, ok := params["repo[]"]; ok {
			for i := range newRepos {
				newRepos[i] = "^" + regexp.QuoteMeta(newRepos[i]) + "$"
			}
			query.Repo = strings.Join(newRepos, "|")
		}
	}

	if fc, ok := params["fold_case"]; ok {
		if fc[0] == "false" {
			query.FoldCase = false
		} else if fc[0] == "true" {
			query.FoldCase = true
		} else {
			query.FoldCase = strings.IndexAny(query.Line, "ABCDEFGHIJKLMNOPQRSTUVWXYZ") == -1
		}
	}

	return query, regex, err
}

var (
	ErrTimedOut = errors.New("timed out talking to backend")
)

func stringSlice(ss []string) []string {
	if ss != nil {
		return ss
	}
	return []string{}
}

func (s *server) doSearch(ctx context.Context, backend *Backend, q *pb.Query) (*ReplySearch, error) {
	var search *pb.CodeSearchResult
	var err error

	start := time.Now()

	ctx, cancel := context.WithTimeout(ctx, 30*time.Second)
	defer cancel()

	if id, ok := reqid.FromContext(ctx); ok {
		ctx = metadata.AppendToOutgoingContext(ctx, "Request-Id", string(id))
	}

	search, err = backend.Codesearch.Search(
		ctx, q,
		grpc.FailFast(false),
	)
	if err != nil {
		log.Printf(ctx, "error talking to backend err=%s", err)
		return nil, err
	}

	reply := &ReplySearch{
		Results:     make([]*Result, 0),
		FileResults: make([]*FileResult, 0),
		SearchType:  "normal",
	}

	if q.FilenameOnly {
		reply.SearchType = "filename_only"
	}

	for _, r := range search.Results {
		reply.Results = append(reply.Results, &Result{
			Tree:          r.Tree,
			Version:       r.Version,
			Path:          r.Path,
			LineNumber:    int(r.LineNumber),
			ContextBefore: stringSlice(r.ContextBefore),
			ContextAfter:  stringSlice(r.ContextAfter),
			Bounds:        [2]int{int(r.Bounds.Left), int(r.Bounds.Right)},
			Line:          r.Line,
		})
	}

	for _, r := range search.FileResults {
		reply.FileResults = append(reply.FileResults, &FileResult{
			Tree:    r.Tree,
			Version: r.Version,
			Path:    r.Path,
			Bounds:  [2]int{int(r.Bounds.Left), int(r.Bounds.Right)},
		})
	}

	reply.Info = &Stats{
		RE2Time:     search.Stats.Re2Time,
		GitTime:     search.Stats.GitTime,
		SortTime:    search.Stats.SortTime,
		IndexTime:   search.Stats.IndexTime,
		AnalyzeTime: search.Stats.AnalyzeTime,
		TotalTime:   int64(time.Since(start) / time.Millisecond),
		ExitReason:  search.Stats.ExitReason.String(),
	}
	return reply, nil
}

func (s *server) ServeAPISearch(ctx context.Context, w http.ResponseWriter, r *http.Request) {
	backendName := r.URL.Query().Get(":backend")
	var backend *Backend
	if backendName != "" {
		backend = s.bk[backendName]
		if backend == nil {
			writeError(ctx, w, 400, "bad_backend",
				fmt.Sprintf("Unknown backend: %s", backendName))
			return
		}
	} else {
		for _, backend = range s.bk {
			break
		}
	}

	q, is_regex, err := extractQuery(ctx, r)

	if err != nil {
		writeError(ctx, w, 400, "bad_query", err.Error())
		return
	}

	if q.Line == "" {
		kind := "string"
		if is_regex {
			kind = "regex"
		}
		msg := fmt.Sprintf("You must specify a %s to match", kind)
		writeError(ctx, w, 400, "bad_query", msg)
		return
	}

	if q.MaxMatches == 0 {
		q.MaxMatches = s.config.DefaultMaxMatches
	}

	reply, err := s.doSearch(ctx, backend, &q)

	if err != nil {
		log.Printf(ctx, "error in search err=%s", err)
		writeQueryError(ctx, w, err)
		return
	}

	// if s.honey != nil {
	// 	e := s.honey.NewEvent()
	// 	reqid, ok := reqid.FromContext(ctx)
	// 	if ok {
	// 		e.AddField("request_id", reqid)
	// 	}
	// 	e.AddField("backend", backend.Id)
	// 	e.AddField("query_line", q.Line)
	// 	e.AddField("query_file", q.File)
	// 	e.AddField("query_repo", q.Repo)
	// 	e.AddField("query_foldcase", q.FoldCase)
	// 	e.AddField("query_not_file", q.NotFile)
	// 	e.AddField("query_not_repo", q.NotRepo)
	// 	e.AddField("max_matches", q.MaxMatches)

	// 	e.AddField("result_count", len(reply.Results))
	// 	e.AddField("re2_time", reply.Info.RE2Time)
	// 	e.AddField("git_time", reply.Info.GitTime)
	// 	e.AddField("sort_time", reply.Info.SortTime)
	// 	e.AddField("index_time", reply.Info.IndexTime)
	// 	e.AddField("analyze_time", reply.Info.AnalyzeTime)

	// 	e.AddField("exit_reason", reply.Info.ExitReason)
	// 	e.Send()
	// }

	log.Printf(ctx,
		"responding success results=%d why=%s stats=%s",
		len(reply.Results),
		reply.Info.ExitReason,
		asJSON{reply.Info})

	replyJSON(ctx, w, 200, reply)
}
