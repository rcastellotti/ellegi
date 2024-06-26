package server

import (
	"html/template"
)

type BackendConfig struct {
	Id   string `json:"id"`
	Addr string `json:"addr"`
}

type Config struct {
	// Location of the directory containing templates and static
	// assets. This should point at the "web" directory of the
	// repository.
	DocRoot string `json:"docroot"`

	Feedback struct {
		// The mailto address for the "feedback" url.
		MailTo string `json:"mailto"`
	} `json:"feedback"`

	// List of backends to connect to. Each backend must include
	// the "id" and "addr" fields.
	Backends []BackendConfig `json:"backends"`

	// The address to listen on, as HOST:PORT.
	Listen string `json:"listen"`

	// HTML injected into layout template
	// for site-specific customizations
	HeaderHTML template.HTML `json:"header_html"`

	Sentry struct {
		URI string `json:"uri"`
	} `json:"sentry"`

	// Whether to re-load templates on every request
	Reload bool `json:"reload"`

	DefaultMaxMatches int32 `json:"default_max_matches"`

	// Same json config structure that the backend uses when building indexes;
	// used here for repository browsing.
	IndexConfig IndexConfig `json:"index_config"`

	DefaultSearchRepos []string `json:"default_search_repos"`

	LinkConfigs []LinkConfig `json:"file_links"`

	// Maximum gRPC receive message size in bytes: this allows larger result sets from codesearch
	GrpcMaxRecvMessageSize int `json:"grpc_max_recv_message_size"`

	// Maximum gRPC send message size in bytes: this allows larger queries to codesearch
	GrpcMaxSendMessageSize int `json:"grpc_max_send_message_size"`

	// Additional file extensions to highlight with PrismJS in the built-in fileview
	FileExtToLang map[string]string `json:"file_ext_to_lang"`

	// Regular expression to match the first line of a file to determine its
	// language.  This is used to override the language detection for files that
	// don't have a recognized extension.
	FileFirstLineRegexToLang map[string]string `json:"file_first_line_regex_to_lang"`
}

type IndexConfig struct {
	Name         string       `json:"name"`
	Repositories []RepoConfig `json:"repositories"`
}

type RepoConfig struct {
	Path           string            `json:"path"`
	Name           string            `json:"name"`
	Revisions      []string          `json:"revisions"`
	Metadata       map[string]string `json:"metadata"`
	WalkSubmodules bool              `json:"walk_submodules"`
}

type LinkConfig struct {
	Label            string `json:"label"`
	UrlTemplate      string `json:"url_template"`
	WhitelistPattern string `json:"whitelist_pattern"`
	Target           string `json:"target"`
}
