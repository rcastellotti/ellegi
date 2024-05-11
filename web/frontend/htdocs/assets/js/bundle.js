/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

module.exports = jQuery;

/***/ }),
/* 1 */
/***/ (function(module, exports) {

module.exports = _;

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

$ = __webpack_require__(0);

pages = {
  codesearch: __webpack_require__(3),
  fileview: __webpack_require__(9)
};

$(function(){
  if (window.page) {
    pages[window.page].init(window.scriptData);
  }
});


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

var html = __webpack_require__(4);
var Backbone = __webpack_require__(5);
var Cookies = __webpack_require__(6);

var Codesearch = __webpack_require__(7).Codesearch;
var RepoSelector = __webpack_require__(8);

var KeyCodes = {
  SLASH_OR_QUESTION_MARK: 191
};

function getSelectedText() {
  return window.getSelection ? window.getSelection().toString() : null;
}

function init(initData) {
"use strict";

var h = new html.HTMLFactory();
var last_url_update = 0;

function vercmp(a, b) {
  var re = /^([0-9]*)([^0-9]*)(.*)$/;
  var abits, bbits;
  var anum, bnum;
  while (a.length && b.length) {
    abits = re.exec(a);
    bbits = re.exec(b);
    if ((abits[1] === '') != (bbits[1] === '')) {
      return abits[1] ? -1 : 1;
    }
    if (abits[1] !== '') {
      anum = parseInt(abits[1]);
      bnum = parseInt(bbits[1])
      if (anum !== bnum)
        return anum - bnum;
    }

    if (abits[2] !== bbits[2]) {
      return abits[2] < bbits[2] ? -1 : 1
    }

    a = abits[3];
    b = bbits[3];
  }

  return a.length - b.length;
}

function shorten(ref) {
  var match = /^refs\/(tags|branches)\/(.*)/.exec(ref);
  if (match)
    return match[2];
  match = /^([0-9a-f]{8})[0-9a-f]+$/.exec(ref);
  if (match)
    return match[1];
  // If reference is origin/foo, assume that foo is
  // the branch name.
  match = /^origin\/(.*)/.exec(ref);
  if (match) {
    return match[1];
  }
  return ref;
}

function url(tree, version, path, lno) {
  if (tree in CodesearchUI.internalViewRepos) {
    return internalUrl(tree, path, lno);
  } else {
    return externalRepoUrl(tree, version, path, lno);
  }
}

function internalUrl(tree, path, lno) {
  path = path.replace(/^\/+/, '');  // Trim any leading slashes
  var url = "/view/" + tree + "/" + path;
  if (lno !== undefined) {
    url += "#L" + lno;
  }
  return url;
}

function externalRepoUrl(tree, version, path, lno) {
  var backend = Codesearch.in_flight.backend;
  var repo_map = CodesearchUI.repo_urls[backend];
  if (!repo_map) {
    return null;
  }
  if (!repo_map[tree]) {
    return null;
  }
  return externalUrl(repo_map[tree], tree, version, path, lno);
}

function externalUrl(url, tree, version, path, lno) {
  if (lno === undefined) {
      lno = 1;
  }

  // If {path} already has a slash in front of it, trim extra leading
  // slashes from `path` to avoid a double-slash in the URL.
  if (url.indexOf('/{path}') !== -1) {
    path = path.replace(/^\/+/, '');
  }

  // the order of these replacements is used to minimize conflicts
  url = url.replace(/{lno}/g, lno);
  url = url.replace(/{version}/g, shorten(version));
  url = url.replace(/{name}/g, tree);
  url = url.replace(/{basename}/g, tree.split("/")[1]); // E.g. "foo" in "username/foo"
  url = url.replace(/{path}/g, path);
  return url;
}

function renderLinkConfigs(linkConfigs, tree, version, path, lno) {
  linkConfigs = linkConfigs.filter(function(linkConfig) {
    return !linkConfig.whitelist_pattern ||
      linkConfig.whitelist_pattern.test(tree + ':' + version + ':' + path);
  });

  var links = linkConfigs.map(
    function(linkConfig) {
      var attrs = {
        cls: "file-action-link",
        href: externalUrl(
          linkConfig.url_template,
          tree,
          version,
          path,
          lno
        ),
      };
      if (linkConfig.target) {
        attrs.target = linkConfig.target;
      }
      return h.a(
        attrs,
        [linkConfig.label]
      );
    }
  );
  var out = [];
  for (var i = 0; i < links.length; i++) {
    if (i > 0) {
      out.push(h.span({cls: "file-action-link-separator",}, ["\u00B7"]));
    }
    out.push(links[i]);
  }
  return out;
}

var MatchView = Backbone.View.extend({
  tagName: 'div',
  initialize: function() {
    this.model.on('change', this.render, this);
  },
  render: function() {
    var div = this._render();
    this.setElement(div);
    return this;
  },
  _renderLno: function(n, isMatch) {
    var lnoStr = n.toString() + (isMatch ? ":" : "-");
    var classes = ['lno-link'];
    if (isMatch) classes.push('matchlno');
    return h.a({cls: classes.join(' '), href: this.model.url(n)}, [
      h.span({cls: 'lno', 'aria-label': lnoStr}, [])
    ]);
  },
  _render: function() {
    var i;
    var ctx_before = [], ctx_after = [];
    var lno = this.model.get('lno');
    var ctxBefore = this.model.get('context_before'), clip_before = this.model.get('clip_before');
    var ctxAfter = this.model.get('context_after'), clip_after = this.model.get('clip_after');

    var lines_to_display_before = Math.max(0, ctxBefore.length - (clip_before || 0));
    for (i = 0; i < lines_to_display_before; i ++) {
      ctx_before.unshift(
        this._renderLno(lno - i - 1, false),
        h.span([this.model.get('context_before')[i]]),
        h.span({}, [])
      );
    }
    var lines_to_display_after = Math.max(0, ctxAfter.length - (clip_after || 0));
    for (i = 0; i < lines_to_display_after; i ++) {
      ctx_after.push(
        this._renderLno(lno + i + 1, false),
        h.span([this.model.get('context_after')[i]]),
        h.span({}, [])
      );
    }
    var line = this.model.get('line');
    var bounds = this.model.get('bounds');
    var pieces = [line.substring(0, bounds[0]),
                  line.substring(bounds[0], bounds[1]),
                  line.substring(bounds[1])];

    var classes = ['match'];
    if(clip_before !== undefined) classes.push('clip-before');
    if(clip_after !== undefined) classes.push('clip-after');

    var links = renderLinkConfigs(
      CodesearchUI.linkConfigs.filter(function(linkConfig) {
        return linkConfig.url_template.includes('{lno}');
      }),
      this.model.get('tree'),
      this.model.get('version'),
      this.model.get('path'),
      lno
    );

    var matchElement = h.div({cls: classes.join(' ')}, [
      h.div({cls: 'contents'}, [].concat(
        ctx_before,
        [
            this._renderLno(lno, true),
            h.span({cls: 'matchline'}, [pieces[0], h.span({cls: 'matchstr'}, [pieces[1]]), pieces[2]]),
            h.span({cls: 'matchlinks'}, links)
        ],
        ctx_after
      ))
    ]);

    return matchElement;
  }
});

/**
 * A Match represents a single match in the code base.
 *
 * This model wraps the JSON response from the Codesearch backend for an individual match.
 */
var Match = Backbone.Model.extend({
  path_info: function() {
    var tree = this.get('tree');
    var version = this.get('version');
    var path = this.get('path');
    return {
      id: tree + ':' + version + ':' + path,
      tree: tree,
      version: version,
      path: path
    }
  },

  url: function(lno) {
    if (lno === undefined) {
      lno = this.get('lno');
    }
    return url(this.get('tree'), this.get('version'), this.get('path'), lno);
  },
});

/** A set of Matches at a single path. */
var FileGroup = Backbone.Model.extend({
  initialize: function(path_info) {
    // The id attribute is used by collections to fetch models
    this.id = path_info.id;
    this.path_info = path_info;
    this.matches = [];
  },

  add_match: function(match) {
    this.matches.push(match);
  },

  /** Prepare the matches for rendering by clipping the context of matches to avoid duplicate
   *  lines being displayed in the search results.
   *
   * This function operates under these assumptions:
   * - The matches are all for the same file
   * - Two matches cannot have the same line number
   */
  process_context_overlaps: function() {
    if(!(this.matches) || this.matches.length < 2) {
      return; // We don't have overlaps unless we have at least two things
    }

    // NOTE: The logic below requires matches to be sorted by line number.
    this.matches.sort(function(a, b) {
      return a.get('lno') - b.get('lno');
    });

    for(var i = 1, len = this.matches.length; i < len; i++) {
      var previous_match = this.matches[i - 1], this_match = this.matches[i];
      var last_line_of_prev_context = previous_match.get('lno') + previous_match.get('context_after').length;
      var first_line_of_this_context = this_match.get('lno') - this_match.get('context_before').length;
      var num_intersecting_lines = (last_line_of_prev_context - first_line_of_this_context) + 1;
      if(num_intersecting_lines >= 0) {
        // The matches are intersecting or share a boundary.
        // Try to split the context between the previous match and this one.
        // Uneven splits should leave the latter element with the larger piece.

        // split_at will be the first line number grouped with the latter element.
        var split_at = parseInt(Math.ceil((previous_match.get('lno') + this_match.get('lno')) / 2.0), 10);
        if (split_at < first_line_of_this_context) {
            split_at = first_line_of_this_context;
        } else if (last_line_of_prev_context + 1 < split_at) {
            split_at = last_line_of_prev_context + 1;
        }

        var clip_for_previous = last_line_of_prev_context - (split_at - 1);
        var clip_for_this = split_at - first_line_of_this_context;
        previous_match.set('clip_after', clip_for_previous);
        this_match.set('clip_before', clip_for_this);
      } else {
        previous_match.unset('clip_after');
        this_match.unset('clip_before');
      }
    }
  }
});

/** A set of matches that are automatically grouped by path. */
var SearchResultSet = Backbone.Collection.extend({
  add_match: function(match) {
    var path_info = match.path_info();
    var file_group = this.get(path_info.id);
    if(!file_group) {
      file_group = new FileGroup(path_info);
      this.add(file_group);
    }
    file_group.add_match(match);
  },

  num_matches: function() {
    return this.reduce(function(memo, file_group) {
      return memo + file_group.matches.length;
    }, 0);
  }
});

/**
 * A FileMatch represents a single filename match in the code base.
 *
 * This model wraps the JSON response from the Codesearch backend for an individual match.
 *
 * XXX almost identical to Match
 */
var FileMatch = Backbone.Model.extend({
  path_info: function() {
    var tree = this.get('tree');
    var version = this.get('version');
    var path = this.get('path');
    return {
      id: tree + ':' + version + ':' + path,
      tree: tree,
      version: version,
      path: path,
      bounds: this.get('bounds')
    }
  },

  url: function() {
    return url(this.get('tree'), this.get('version'), this.get('path'));
  },
});

var FileMatchView = Backbone.View.extend({
  tagName: 'div',

  render: function() {
    var path_info = this.model.path_info();
    var pieces = [
      path_info.path.substring(0, path_info.bounds[0]),
      path_info.path.substring(path_info.bounds[0], path_info.bounds[1]),
      path_info.path.substring(path_info.bounds[1])
    ];
    var repoLabel = [
      h.span({cls: "repo"}, [path_info.tree, ':']),
      h.span({cls: "version"}, [shorten(path_info.version), ':']),
      pieces[0],
      h.span({cls: "matchstr"}, [pieces[1]]),
      pieces[2]
    ];

    var el = this.$el;
    el.empty();
    el.addClass('filename-match');
    el.append(h.a({cls: 'label header result-path', href: this.model.url()}, repoLabel));
    return this;
  }
});

var SearchState = Backbone.Model.extend({
  defaults: function() {
    return {
      context: true,
      displaying: null,
      error: null,
      search_type: "",
      time: null,
      why: null
    };
  },

  initialize: function() {
    this.search_map = {};
    this.search_results = new SearchResultSet();
    this.file_search_results = new Backbone.Collection();
    this.search_id = 0;
    this.on('change:displaying', this.new_search, this);
  },

  new_search: function() {
    this.set({
        error: null,
        time: null,
        why: null
    });
    this.search_results.reset();
    this.file_search_results.reset();
    for (var k in this.search_map) {
      if (parseInt(k) < this.get('displaying'))
        delete this.search_map[k];
    }
  },

  next_id: function() {
    return ++this.search_id;
  },

  dispatch: function (search) {
    var cur = this.search_map[this.get('displaying')];
    if (cur &&
        cur.q === search.q &&
        cur.fold_case === search.fold_case &&
        cur.regex === search.regex &&
        cur.backend === search.backend &&
        _.isEqual(cur.repo, search.repo)) {
      return false;
    }
    var id = this.next_id();
    search.id = id;
    this.search_map[id] = {
      q: search.q,
      fold_case: search.fold_case,
      regex: search.regex,
      backend: search.backend,
      repo: search.repo
    };
    if (!search.q.length) {
      this.set('displaying', id);
      return false;
    }
    return true;
  },

  url: function() {
    var q = {};
    var current = this.search_map[this.get('displaying')];
    if (!current)
      return '/search';
    var base = '/search';

    if (current.q !== "") {
      q.q = current.q;
      q.fold_case = current.fold_case;
      q.regex = current.regex;
      q.context = this.get('context');
      q.repo = current.repo;
    }

    if (current.backend) {
      base += "/" + current.backend
    } else if (CodesearchUI.input_backend) {
      base += "/" + CodesearchUI.input_backend.val();
    }
    var qs = $.param(q);
    return base + (qs ? "?" + qs : "");
  },

  title: function() {
    var current = this.search_map[this.get('displaying')];
    if (!current || !current.q)
      return "code search";
    return current.q + " ⋅ search";
  },

  handle_error: function (search, error) {
    if (search === this.search_id) {
      this.set('displaying', search);
      this.set('error', error);
    }
  },

  handle_match: function (search, match) {
    if (search < this.get('displaying'))
      return false;
    this.set('displaying', search);
    var m = _.clone(match);
    m.backend = this.search_map[search].backend;
    this.search_results.add_match(new Match(m));
  },
  handle_file_match: function (search, file_match) {
    if (search < this.get('displaying'))
      return false;
    this.set('displaying', search);
    var fm = _.clone(file_match);
    fm.backend = this.search_map[search].backend;
    this.file_search_results.add(new FileMatch(fm));
  },
  handle_done: function (search, time, search_type, why) {
    if (search < this.get('displaying'))
      return false;
    this.set('displaying', search);
    this.set({time: time, search_type: search_type, why: why});
    this.search_results.trigger('search-complete');
  }
});

var FileGroupView = Backbone.View.extend({
  tagName: 'div',

  render_header: function(tree, version, path) {
    var basename, dirname;
    var indexOfLastPathSep = path.lastIndexOf('/');

    if(indexOfLastPathSep !== -1) {
      basename = path.substring(indexOfLastPathSep + 1, path.length);
      dirname = path.substring(0, indexOfLastPathSep + 1);
    } else {
      basename = path; // path doesn't contain any dir parts, only the basename
      dirname = '';
    }

    var first_match = this.model.matches[0];

    var headerChildren = [
      h.span(
        {cls: 'header-path'},
        [
          h.a(
            {cls: 'result-path', href: first_match.url()},
            [
              h.span({cls: "repo"}, [tree, ':']),
              h.span({cls: "version"}, [shorten(version), ':']),
              dirname,
              h.span({cls: "filename"}, [basename]),
            ]
          ),
        ]
      ),
      h.div(
        {cls: 'header-links'},
        renderLinkConfigs(CodesearchUI.linkConfigs, tree, version, path, first_match.get('lno'))
      ),
    ];
    return h.div({cls: 'header'}, headerChildren);
  },

  render: function() {
    var matches = this.model.matches;
    var el = this.$el;
    el.empty();
    el.append(this.render_header(this.model.path_info.tree, this.model.path_info.version, this.model.path_info.path));
    matches.forEach(function(match) {
      el.append(
        new MatchView({model:match}).render().el
      );
    });
    el.addClass('file-group');
    return this;
  }
});

var MatchesView = Backbone.View.extend({
  el: $('#results'),
  events: {
    'click .file-extension': '_limitExtension',
    'keydown': '_handleKey',
  },
  initialize: function() {
    this.model.search_results.on('search-complete', this.render, this);
    this.model.search_results.on('rerender', this.render, this);
  },
  render: function() {
    this.$el.empty();

    // Collate which file extensions (.py, .go, etc) are most common.
    // countExtension() is called for file_search_results and search_results
    var extension_map = {};
    var countExtension = function(path) {
      var r = /[^\/](\.[a-z.]{1,6})$/i;
      var match = path.match(r);
      if (match) {
        var ext = match[1];
        extension_map[ext] = extension_map[ext] ? extension_map[ext] + 1 : 1;
      }
    }

    var pathResults = h.div({'cls': 'path-results'});
    var count = 0;
    this.model.file_search_results.each(function(file) {
      if (this.model.get('search_type') == 'filename_only' || count < 10) {
        var view = new FileMatchView({model: file});
        pathResults.append(view.render().el);
      }
      countExtension(file.attributes.path);
      count += 1;
    }, this);
    this.$el.append(pathResults);

    this.model.search_results.each(function(file_group) {
      file_group.process_context_overlaps();
      var view = new FileGroupView({model: file_group});
      this.$el.append(view.render().el);
      countExtension(file_group.path_info.path);
    }, this);

    var i = this.model.search_id;
    var query = this.model.search_map[i].q;
    var already_file_limited = /\bfile:/.test(query);
    if (!already_file_limited)
      this._render_extension_buttons(extension_map);

    return this;
  },
  _render_extension_buttons: function(extension_map) {
    // Display a series of buttons for the most common file extensions
    // among the current search results, that each narrow the search to
    // files matching that extension.
    var extension_array = [];
    for (var ext in extension_map)
      extension_array.push([extension_map[ext], ext]);

    if (extension_array.length < 2)
      return;

    extension_array.sort(function(a, b) {return b[0] - a[0];})

    var popular_extensions = []
    var end = Math.min(extension_array.length, 5);
    for (var i=0; i < end; i++)
      popular_extensions.push(extension_array[i][1]);
    popular_extensions.sort();

    var help = 'Narrow to:';
    var fileExtensions = h.div({'cls': 'file-extensions'}, [help]);
    for (var i=0; i < popular_extensions.length; i++) {
      var ext = popular_extensions[i];
      fileExtensions.append(h.button({'cls': 'file-extension'}, [ext]));
    }
    this.$el.prepend(fileExtensions);
  },
  _limitExtension: function(e) {
    var ext = e.target.textContent;
    var q = CodesearchUI.input.val();
    if (CodesearchUI.input_regex.is(':checked'))
      q = 'file:\\' + ext + '$ ' + q;
    else
      q = 'file:' + ext + ' ' + q;
    CodesearchUI.input.val(q);
    CodesearchUI.newsearch();
  },
  _handleKey: function(e) {
    if (event.altKey || event.ctrlKey || event.metaKey || event.shiftKey)
      return;
    var which = event.which;
    if (which === KeyCodes.SLASH_OR_QUESTION_MARK) {
      var t = getSelectedText();
      if (!t)
        return;
      event.preventDefault();
      if (CodesearchUI.input_regex.is(':checked'))
        t = t.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // from mozilla docs

      // Make sure that the search results the user is looking at, in
      // which they've selected text, get persisted in their browser
      // history so that they can come back to them.
      last_url_update = 0;

      CodesearchUI.input.val(t);
      CodesearchUI.newsearch();
    }
  }
});

var ResultView = Backbone.View.extend({
  el: $('#resultarea'),
  initialize: function() {
    this.matches_view = new MatchesView({model: this.model});
    this.results      = this.$('#numresults');
    this.errorbox     = $('#regex-error');
    this.time         = this.$('#searchtime');
    this.last_url     = null;
    this.last_title   = null;

    this.model.on('all', this.render, this);
    this.model.search_results.on('all', this.render, this);
  },

  render: function() {
    if (this.model.get('displaying') === null) {
      return;
    }
    if (this.model.get('error')) {
      this.errorbox.find('#errortext').text(this.model.get('error'));
      this.errorbox.show();
    } else {
      this.errorbox.hide()
    }

    var url = this.model.url();
    if (this.last_url !== url ) {
      if (history.pushState) {
        var browser_url = window.location.pathname + window.location.search;
        if (browser_url !== url) {
          // If the user is typing quickly, just keep replacing the
          // current URL.  But after they've paused, enroll the URL they
          // paused at into their browser history.
          var now = Date.now();
          var two_seconds = 2000;
          if (this.last_url === null) {
            // If this.last_url is null, that means this is the initial
            // navigation. We should never pushState here, otherwise the
            // user will need to backspace twice to go back to the
            // previous page.
            history.replaceState(null, '', url);
          } else if (now - last_url_update > two_seconds) {
            history.pushState(null, '', url);
          } else {
            history.replaceState(null, '', url);
          }
          last_url_update = now;
        }
      }
      this.last_url = url;
    }

    var title = this.model.title();
    if (this.last_title !== title) {
      document.title = title;
      this.last_title = title;
    }

    if (this.model.search_map[this.model.get('displaying')].q === '' ||
       this.model.get('error')) {
      this.$el.hide();
      $('#helparea').show();
      return this;
    }

    $('#results').toggleClass('no-context', !this.model.get('context'));

    this.$el.show();
    $('#helparea').hide();

    if (this.model.get('time')) {
      this.$('#searchtimebox').show();
      var time = this.model.get('time');
      this.time.text((time/1000) + "s")
    } else {
      this.$('#searchtimebox').hide();
    }

    var results;
    if (this.model.get('search_type') == 'filename_only') {
      results = '' + this.model.file_search_results.length;
    } else {
      results = '' + this.model.search_results.num_matches();
    }
    if (this.model.get('why') !== 'NONE')
      results = results + '+';
    this.results.text(results);

    return this;
  }
});

var CodesearchUI = function() {
  return {
    state: new SearchState(),
    view: null,
    onload: function() {
      if (CodesearchUI.input)
        return;

      CodesearchUI.view = new ResultView({model: CodesearchUI.state});

      CodesearchUI.input      = $('#searchbox');
      CodesearchUI.input_repos = $('#repos');
      CodesearchUI.input_backend = $('#backend');
      if (CodesearchUI.input_backend.length == 0)
        CodesearchUI.input_backend = null;
      CodesearchUI.inputs_case = $('input[name=fold_case]');
      CodesearchUI.input_regex = $('input[name=regex]');
      CodesearchUI.input_context = $('input[name=context]');

      if (CodesearchUI.inputs_case.filter(':checked').length == 0) {
          CodesearchUI.inputs_case.filter('[value=auto]').attr('checked', true);
      }

      RepoSelector.init();
      CodesearchUI.update_repo_options();

      CodesearchUI.init_query();

      CodesearchUI.input.keydown(CodesearchUI.keypress);
      CodesearchUI.input.bind('paste', CodesearchUI.keypress);
      CodesearchUI.input.focus();
      if (CodesearchUI.input_backend)
        CodesearchUI.input_backend.change(CodesearchUI.select_backend);

      CodesearchUI.inputs_case.change(CodesearchUI.keypress);
      CodesearchUI.input_regex.change(CodesearchUI.keypress);
      CodesearchUI.input_repos.change(CodesearchUI.keypress);
      CodesearchUI.input_context.change(CodesearchUI.toggle_context);

      CodesearchUI.input_regex.change(function(){
        CodesearchUI.set_pref('regex', CodesearchUI.input_regex.prop('checked'));
      });
      CodesearchUI.input_repos.change(function(){
        CodesearchUI.set_pref('repos', CodesearchUI.input_repos.val());
      });
      CodesearchUI.input_context.change(function(){
        CodesearchUI.set_pref('context', CodesearchUI.input_context.prop('checked'));
      });

      CodesearchUI.toggle_context();

      Codesearch.connect(CodesearchUI);
      $('.query-hint code').click(function(e) {
        var ext = e.target.textContent;
        var q = CodesearchUI.input.val();
        if( !q.includes(ext)
            && ((ext.indexOf('-') == 0 && !q.includes(ext.substring(1)))
            || (ext.indexOf('-') != 0 && !q.includes('-' + ext.substring)))
        ) {
          q = q + ' ' + ext;
        }
        CodesearchUI.input.val(q);
        CodesearchUI.input.focus();
       })

      // Update the search when the user hits Forward or Back.
      window.onpopstate = function(event) {
        var parms = CodesearchUI.parse_query_params();
        CodesearchUI.init_query_from_parms(parms);
        CodesearchUI.newsearch();
      }
    },
    toggle_context: function(){
      CodesearchUI.state.set('context', CodesearchUI.input_context.prop('checked'));
    },
    // Initialize query from URL or user's saved preferences
    init_query: function() {
      var parms = CodesearchUI.parse_query_params();

      var hasParms = false;
      for (var p in parms) {
        hasParms = true;
        break;
      }

      if (hasParms) {
        CodesearchUI.init_query_from_parms(parms);
      } else {
        CodesearchUI.init_controls_from_prefs();
      }

      setTimeout(CodesearchUI.keypress, 0);
    },
    init_query_from_parms: function(parms) {
      var q = [];
      if (parms.q)
        q.push(parms.q[0]);
      if (parms.file)
        q.push("file:" + parms.file[0]);
      CodesearchUI.input.val(q.join(' '));

      if (parms.fold_case) {
        CodesearchUI.inputs_case.filter('[value='+parms.fold_case[0]+']').attr('checked', true);
      }

      if (parms.regex) {
        CodesearchUI.input_regex.prop('checked', parms.regex[0] === "true");
      }

      if (parms.context) {
        CodesearchUI.input_context.prop('checked', parms.context[0] === 'true');
      }

      var backend = null;
      if (parms.backend)
        backend = parms.backend;
      var m;
      if (m = (new RegExp("/search/([^\/]+)/?").exec(window.location.pathname))) {
        backend = m[1];
      }
      if (backend && CodesearchUI.input_backend) {
        var old_backend = CodesearchUI.input_backend.val();
        CodesearchUI.input_backend.val(backend);

        // Something (bootstrap-select?) messes with the behaviour of val() on
        // normal select elements, so that trying to set an invalid value sets
        // null, rather than leaving the value unchanged. We manually check and
        // roll back if that happens (e.g. because someone navigated to a URL
        // like "/search/bogus?q=foo").
        if (CodesearchUI.input_backend.val() === null) {
            CodesearchUI.input_backend.val(old_backend);
        }
      }

      var repos = [];
      if (parms.repo)
        repos = repos.concat(parms.repo);
      if (parms['repo[]'])
        repos = repos.concat(parms['repo[]']);
      RepoSelector.updateSelected(repos);
    },
    init_controls_from_prefs: function() {
      var prefs = Cookies.getJSON('prefs');
      if (!prefs) {
        prefs = {};
      }
      if (prefs['regex'] !== undefined) {
        CodesearchUI.input_regex.prop('checked', prefs['regex']);
      }
      if (prefs['repos'] !== undefined) {
        RepoSelector.updateSelected(prefs['repos']);
      } else if (CodesearchUI.defaultSearchRepos !== undefined) {
        RepoSelector.updateSelected(CodesearchUI.defaultSearchRepos);
      }
      if (prefs['context'] !== undefined) {
        CodesearchUI.input_context.prop('checked', prefs['context']);
      }
    },
    set_pref: function(key, value) {
      // Load from the cookie again every time in case some other pref has been
      // changed out from under us.
      var prefs = Cookies.getJSON('prefs');
      if (!prefs) {
        prefs = {};
      }
      prefs[key] = value;
      Cookies.set('prefs', prefs, { expires: 36500 });
    },
    parse_query_params: function() {
      var urlParams = {};
      var e,
          a = /\+/g,
          r = /([^&=]+)=?([^&]*)/g,
          d = function (s) { return decodeURIComponent(s.replace(a, " ")); },
          q = window.location.search.substring(1);

      while (e = r.exec(q)) {
        if (urlParams[d(e[1])]) {
           urlParams[d(e[1])].push(d(e[2]));
        } else {
           urlParams[d(e[1])] = [d(e[2])];
        }
      }
      return urlParams;
    },
    on_connect: function() {
      CodesearchUI.newsearch();
    },
    select_backend: function() {
      if (!CodesearchUI.input_backend)
        return;
      CodesearchUI.update_repo_options();
      CodesearchUI.keypress();
    },
    update_repo_options: function(repos) {
      if (!CodesearchUI.input_backend)
        return;
      var backend = CodesearchUI.input_backend.val();
      RepoSelector.updateOptions(_.keys(CodesearchUI.repo_urls[backend]));
    },
    keypress: function() {
      CodesearchUI.clear_timer();
      CodesearchUI.timer = setTimeout(CodesearchUI.newsearch, 100);
    },
    newsearch: function() {
      CodesearchUI.clear_timer();
      var search = {
        q: CodesearchUI.input.val(),
        fold_case: CodesearchUI.inputs_case.filter(':checked').val(),
        regex: CodesearchUI.input_regex.is(':checked'),
        repo: CodesearchUI.input_repos.val()
      };
      if (CodesearchUI.input_backend)
        search.backend = CodesearchUI.input_backend.val();
      if (CodesearchUI.state.dispatch(search))
        Codesearch.new_search(search);
    },
    clear_timer: function() {
      if (CodesearchUI.timer) {
        clearTimeout(CodesearchUI.timer);
        CodesearchUI.timer = null;
      }
    },
    error: function(search, error) {
      CodesearchUI.state.handle_error(search, error);
    },
    match: function(search, match) {
      CodesearchUI.state.handle_match(search, match);
    },
    file_match: function(search, file_match) {
      CodesearchUI.state.handle_file_match(search, file_match);
    },
    search_done: function(search, time, search_type, why) {
      CodesearchUI.state.handle_done(search, time, search_type, why);
    },
    repo_urls: {}
  };
}();

CodesearchUI.repo_urls = initData.repo_urls;
CodesearchUI.internalViewRepos = initData.internal_view_repos;
CodesearchUI.defaultSearchRepos = initData.default_search_repos;
CodesearchUI.linkConfigs = (initData.link_configs || []).map(function(link_config) {
  if (link_config.whitelist_pattern) {
    link_config.whitelist_pattern = new RegExp(link_config.whitelist_pattern);
  }
  return link_config;
});
CodesearchUI.onload();
}

module.exports = {
  init: init
}


/***/ }),
/* 4 */
/***/ (function(module, exports) {

function HTMLFactory() {}
(function() {
"use strict";
/***
 * A convenient way to create DOM elements. ('cls' will be
 * automatically expanded to 'class', since 'class' may not appear as
 * a key of an object, even in quotes, in Safari.)
 *
 * DIV({cls: "mydiv", style: "color: blue;"}, [
 *   "Some text",
 *   A({href: "/some/location"}, ["A link"]),
 *   DIV({cls: "emptydiv"}),
 *   // if an object is inserted, the value of its 'element'
 *   // attribute will be used
 *   myView,
 *   DIV([
 *     "Both the attributes and the contents are optional",
 *     ["Lists", "are", "flattened"]
 *   })
 * ]);
 */

// XXX find a place to document the contract for *View classes -- they
// should have an attribute named 'element'

// XXX consider not requiring the contents to be wrapped in an
// array. eg: DIV({stuff: 12}, "thing1", "thing2"). backwards
// compatible with current behavior due to array flattening. could
// eliminate spurious wrapper div inserted by Layout.TwoColumnsFixedRight

// XXX allow style to be set as an object
var event_names = {
  blur: true,
  change: true,
  click: true,
  dblclick: true,
  error: true,
  focus: true,
  focusin: true,
  focusout: true,
  keydown: true,
  keypress: true,
  keyup: true,
  load: true,
  mousedown: true,
  mouseenter: true,
  mouseleave: true,
  mousemove: true,
  mouseout: true,
  mouseover: true,
  mouseup: true,
  resize: true,
  scroll: true,
  select: true,
  submit: true
};

// All HTML4 elements, excluding deprecated element
// http://www.w3.org/TR/html4/index/elements.html
// also excluding the following elements that seem unlikely to be used in the body:
// HEAD, HTML, LINK, MAP, META, NOFRAMES, NOSCRIPT, STYLE, TITLE
_(('A ABBR ACRONYM B BDO BIG BLOCKQUOTE BR BUTTON CAPTION CITE CODE COL ' +
   'COLGROUP DD DEL DFN DIV DL DT EM FIELDSET FORM H1 H2 H3 H4 H5 H6 HR ' +
   'I IFRAME IMG INPUT INS KBD LABEL LEGEND LI OBJECT OL OPTGROUP OPTION ' +
   'P PARAM PRE Q S SAMP SCRIPT SELECT SMALL SPAN STRIKE STRONG SUB SUP TABLE ' +
   'TBODY TD TEXTAREA TFOOT TH THEAD TR TT U UL VAR').split(' ')).forEach(
   function (tag) {
     HTMLFactory.prototype[tag.toLowerCase()] = function (arg1, arg2) {
       var attrs, contents;
       if (arg2) {
         attrs = arg1;
         contents = arg2;
       } else {
         if (arg1 instanceof Array) {
           attrs = {};
           contents = arg1;
         } else {
           attrs = arg1;
           contents = [];
         }
       }
       var elt = document.createElement(tag);
       for (var a in attrs) {
         if (a === 'cls')
           elt.setAttribute('class', attrs[a]);
         else if (a === '_for')
           elt.setAttribute('for', attrs[a]);
         else if (event_names[a])
           // XXX creates a dependency on jQuery.. ick..
           ($(elt)[a])(attrs[a]);
         else
           elt.setAttribute(a, attrs[a]);
       }
       var addChildren = function (children) {
         _(children).forEach(function (c) {
           if (!c && c !== '')
             throw new Error("Bad value for element body: " + c);
           else if (c instanceof Array)
             addChildren(c);
           else if (typeof(c) === "string")
             elt.appendChild(document.createTextNode(c));
           else if (typeof(c) === "number")
             elt.appendChild(document.createTextNode(c + ""));
           else if ('element' in c)
             addChildren([c.element]);
           else
             elt.appendChild(c);
         });
       };
       addChildren(contents);
       return elt;
     };
   });
})();

module.exports = {
  HTMLFactory: HTMLFactory
}


/***/ }),
/* 5 */
/***/ (function(module, exports) {

module.exports = Backbone;

/***/ }),
/* 6 */
/***/ (function(module, exports) {

module.exports = Cookies;

/***/ }),
/* 7 */
/***/ (function(module, exports, __webpack_require__) {

$ = __webpack_require__(0);
_ = __webpack_require__(1);

"use strict";
var Codesearch = function() {
  return {
    delegate: null,
    retry_time: 50,
    next_search: null,
    in_flight: null,
    connect: function(delegate) {
      if (delegate !== undefined)
        Codesearch.delegate = delegate;
      if (Codesearch.delegate.on_connect)
        setTimeout(Codesearch.delegate.on_connect, 0)
    },
    new_search: function(opts) {
      Codesearch.next_search = opts;
      if (Codesearch.in_flight == null)
        Codesearch.dispatch()
    },
    dispatch: function() {
      if (!Codesearch.next_search)
        return;
      Codesearch.in_flight = Codesearch.next_search;
      Codesearch.next_search = null;

      var opts = Codesearch.in_flight;

      var url = "/api/v1/search/";
      if ('backend' in opts) {
        url = url + opts.backend;
      }
      var q = {
        q: opts.q,
        fold_case: opts.fold_case,
        regex: opts.regex,
        repo: opts.repo
      };

      var xhr = $.ajax({
        method: 'POST',
        url: url,
        data: q,
        dataType: "json",
      });
      var start = new Date();
      xhr.done(function (data) {
        var elapsed = new Date() - start;
        data.results.forEach(function (r) {
          Codesearch.delegate.match(opts.id, r);
        });
        data.file_results.forEach(function (r) {
          Codesearch.delegate.file_match(opts.id, r);
        });
        Codesearch.delegate.search_done(opts.id, elapsed, data.search_type, data.info.why);
      });
      xhr.fail(function(data) {
        window._err = data;
        if (data.status >= 400 && data.status < 500) {
          var err = JSON.parse(data.responseText);
          Codesearch.delegate.error(opts.id, err.error.message);
        } else {
          var message = "Cannot connect to server";
          if (data.status) {
            message = "Bad response " + data.status + " from server";
          }
          Codesearch.delegate.error(opts.id, message);
          console.log("server error", data.status, data.responseText);
        }
      });
      xhr.always(function() {
        Codesearch.in_flight = null;
        setTimeout(Codesearch.dispatch, 0);
      });
    }
  };
}();

module.exports = {
  Codesearch: Codesearch
}


/***/ }),
/* 8 */
/***/ (function(module, exports, __webpack_require__) {

var $ = __webpack_require__(0);
var _ = __webpack_require__(1);

function init() {
    $('#repos').selectpicker({
        actionsBox: true,
        selectedTextFormat: 'count > 4',
        countSelectedText: '({0} repositories)',
        noneSelectedText: '(all repositories)',
        liveSearch: true,
        width: '20em'
    });
    $('#repos').on('refreshed.bs.select', function () {
        var headers = $(this).parent().find('.dropdown-header');
        headers.css('cursor', 'pointer');
        headers.on('click', function (event) {
            event.stopPropagation();
            var optgroup = $('#repos optgroup[label="' + $(this).text() + '"]')
            var allSelected = !optgroup.children('option:not(:selected)').length;
            optgroup.children().prop('selected', !allSelected);
            $("#repos").selectpicker('refresh').trigger("change");
        });
    });
    $(window).on('keyup', '.bootstrap-select .bs-searchbox input', function(event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
            $(this).val("");
            $("#repos").selectpicker('refresh');
        }
    });
    $(window).keyup(function (keyevent) {
        var code = (keyevent.keyCode ? keyevent.keyCode : keyevent.which);
        if (code == 9 && $('.bootstrap-select button:focus').length) {
            $("#repos").selectpicker('toggle');
            $('.bootstrap-select .bs-searchbox input').focus();
        }
    });
}

function updateOptions(newOptions) {
    // Skip update if the options are the same, to avoid losing selected state.
    var currentOptions = [];
    $('#repos').find('option').each(function(){
        currentOptions.push($(this).attr('value'));
    });
    if (_.isEqual(currentOptions, newOptions)) {
        return;
    }

    $('#repos').empty();

    newOptions.sort()
    var groups = new Map()
    groups.set('/', $('#repos'))

    for (var i = 0; i < newOptions.length; i++) {
        var path = newOptions[i].split('/');
        var group = path.slice(0, path.length - 1).join('/') + '/';
        var option = path[path.length - 1];

        if (!groups.has(group)) {
            var groupDOM = $('<optgroup>').attr('label', group)
            $('#repos').append(groupDOM);
            groups.set(group, groupDOM)
        }
        groups.get(group).append($('<option>').attr('value', group + option).text(option));
    }

    groups.clear()
    $('#repos').selectpicker('refresh');
}

function updateSelected(newSelected) {
    $('#repos').selectpicker('val', newSelected);
}

module.exports = {
    init: init,
    updateOptions: updateOptions,
    updateSelected: updateSelected
}


/***/ }),
/* 9 */
/***/ (function(module, exports, __webpack_require__) {

$ = __webpack_require__(0);

var KeyCodes = {
  ESCAPE: 27,
  ENTER: 13,
  SLASH_OR_QUESTION_MARK: 191
};

function getSelectedText() {
  return window.getSelection ? window.getSelection().toString() : null;
}

function scrollToRange(range, elementContainer) {
  // - If we have a single line, scroll the viewport so that the element is
  // at 1/3 of the viewport.
  // - If we have a range, try and center the range in the viewport
  // - If the range is to high to fit in the viewport, fallback to the single
  //   element scenario for the first line
  var viewport = $(window);
  var viewportHeight = viewport.height();

  var scrollOffset = Math.floor(viewport.height() / 3.0);

  var firstLineElement = elementContainer.find("#L" + range.start);
  if(!firstLineElement.length) {
    // We were given a scroll offset to a line number that doesn't exist in the page, bail
    return;
  }
  if(range.start != range.end) {
    // We have a range, try and center the entire range. If it's to high
    // for the viewport, fallback to revealing the first element.
    var lastLineElement = elementContainer.find("#L" + range.end);
    var rangeHeight = (lastLineElement.offset().top + lastLineElement.height()) - firstLineElement.offset().top;
    if(rangeHeight <= viewportHeight) {
      // Range fits in viewport, center it
      scrollOffset = 0.5 * (viewportHeight - rangeHeight);
    } else {
      scrollOffset = firstLineElement.height() / 2; // Stick to (almost) the top of the viewport
    }
  }

  viewport.scrollTop(firstLineElement.offset().top - scrollOffset);
}

function setHash(hash) {
  if(history.replaceState) {
    history.replaceState(null, null, hash);
  } else {
    location.hash = hash;
  }
}

function parseHashForLineRange(hashString) {
  var parseMatch = hashString.match(/#L(\d+)(?:-L?(\d+))?/);

  if(parseMatch && parseMatch.length === 3) {
    // We have a match on the regex expression
    var startLine = parseInt(parseMatch[1], 10);
    var endLine = parseInt(parseMatch[2], 10);
    if(isNaN(endLine) || endLine < startLine) {
      endLine = startLine;
    }
    return {
      start: startLine,
      end: endLine
    };
  }

  return null;
}

function addHighlightClassesForRange(range, root) {
  var idSelectors = [];
  for(var lineNumber = range.start; lineNumber <= range.end; lineNumber++) {
    idSelectors.push("#L" + lineNumber);
  }
  root.find(idSelectors.join(",")).addClass('highlighted');
}

function expandRangeToElement(element) {
  var range = parseHashForLineRange(document.location.hash);
  if(range) {
    var elementLine = parseInt(element.attr('id').replace('L', ''), 10);
    if(elementLine < range.start) {
      range.end = range.start;
      range.start = elementLine;
    } else {
      range.end = elementLine;
    }
    setHash("#L" + range.start + "-" + range.end);
  }
}

function init(initData) {
  var root = $('.file-content');
  var lineNumberContainer = root.find('.line-numbers');
  var helpScreen = $('.help-screen');

  function doSearch(event, query, newTab) {
    var url;
    if (query !== undefined) {
      url = '/search?q=' + encodeURIComponent(query) + '&repo=' + encodeURIComponent(initData.repo_info.name);
    } else {
      url = '/search';
    }
    if (newTab === true){
      window.open(url);
    } else {
      window.location.href = url
    }
  }

  function showHelp() {
    helpScreen.removeClass('hidden').children().on('click', function(event) {
      // Prevent clicks inside the element to reach the document
      event.stopImmediatePropagation();
      return true;
    });

    $(document).on('click', hideHelp);
  }

  function hideHelp() {
    helpScreen.addClass('hidden').children().off('click');
    $(document).off('click', hideHelp);
    return true;
  }

  function handleHashChange(scrollElementIntoView) {
    if(scrollElementIntoView === undefined) {
      scrollElementIntoView = true; // default if nothing was provided
    }

    // Clear current highlights
    lineNumberContainer.find('.highlighted').removeClass('highlighted');

    // Highlight the current range from the hash, if any
    var range = parseHashForLineRange(document.location.hash);
    if(range) {
      addHighlightClassesForRange(range, lineNumberContainer);
      if(scrollElementIntoView) {
        scrollToRange(range, root);
      }
    }

    // Update the external-browse link
    $('#external-link').attr('href', getExternalLink(range));
    updateFragments(range, $('#permalink, #back-to-head'));
  }

  function getLineNumber(range) {
    if (range == null) {
      // Default to first line if no lines are selected.
      return 1;
    } else if (range.start == range.end) {
      return range.start;
    } else {
      // We blindly assume that the external viewer supports linking to a
      // range of lines. Github doesn't support this, but highlights the
      // first line given, which is close enough.
      return range.start + "-" + range.end;
    }
  }

  function getExternalLink(range) {
    var lno = getLineNumber(range);

    var repoName = initData.repo_info.name;
    var filePath = initData.file_path;

    url = initData.repo_info.metadata['url_pattern'];

    // If url not found, warn user and fail gracefully
    if (!url) { // deal with both undefined and empty string
        console.error("The index file you provided does not provide repositories[x].metadata.url_pattern. External links to file sources will not work. See the README for more information on file viewing.");
        return;
    }

    // If {path} already has a slash in front of it, trim extra leading
    // slashes from `pathInRepo` to avoid a double-slash in the URL.
    if (url.indexOf('/{path}') !== -1) {
      filePath = filePath.replace(/^\/+/, '');
    }

    // XXX code copied
    url = url.replace('{lno}', lno);
    url = url.replace('{version}', initData.commit);
    url = url.replace('{name}', repoName);
    url = url.replace('{path}', filePath);
    return url;
  }

  function updateFragments(range, $anchors) {
    $anchors.each(function() {
      var $a = $(this);
      var href = $a.attr('href').split('#')[0];
      if (range !== null) {
        href += '#L' + getLineNumber(range);
      }
      $a.attr('href', href);
    });
  }

  function processKeyEvent(event) {
    if(event.which === KeyCodes.ENTER) {
      // Perform a new search with the selected text, if any
      var selectedText = getSelectedText();
      if(selectedText) {
        doSearch(event, selectedText, true);
      }
    } else if(event.which === KeyCodes.SLASH_OR_QUESTION_MARK) {
        event.preventDefault();
        if(event.shiftKey) {
          showHelp();
        } else {
          hideHelp();
          doSearch(event, getSelectedText());
        }
    } else if(event.which === KeyCodes.ESCAPE) {
      // Avoid swallowing the important escape key event unless we're sure we want to
      if(!helpScreen.hasClass('hidden')) {
        event.preventDefault();
        hideHelp();
      }
      $('#query').blur();
    } else if(String.fromCharCode(event.which) == 'V') {
      // Visually highlight the external link to indicate what happened
      $('#external-link').focus();
      window.location = $('#external-link').attr('href');
    } else if (String.fromCharCode(event.which) == 'Y') {
      var $a = $('#permalink');
      var permalink_is_present = $a.length > 0;
      if (permalink_is_present) {
        $a.focus();
        window.location = $a.attr('href');
      }
    } else if (String.fromCharCode(event.which) == 'N' || String.fromCharCode(event.which) == 'P') {
      var goBackwards = String.fromCharCode(event.which) === 'P';
      var selectedText = getSelectedText();
      if (selectedText) {
        window.find(selectedText, false /* case sensitive */, goBackwards);
      }
    }
    return true;
  }

  function initializeActionButtons(root) {
    // Map out action name to function call, and automate the details of actually hooking
    // up the event handling.
    var ACTION_MAP = {
      search: doSearch,
      help: showHelp,
    };

    for(var actionName in ACTION_MAP) {
      root.on('click auxclick', '[data-action-name="' + actionName + '"]',
        // We can't use the action mapped handler directly here since the iterator (`actioName`)
        // will keep changing in the closure of the inline function.
        // Generating a click handler on the fly removes the dependency on closure which
        // makes this work as one would expect. #justjsthings.
        (function(handler) {
          return function(event) {
            event.preventDefault();
            event.stopImmediatePropagation(); // Prevent immediately closing modals etc.
            handler.call(this, event);
          }
        })(ACTION_MAP[actionName])
      )
    }
  }

  var showSelectionReminder = function () {
    $('.without-selection').hide();
    $('.with-selection').show();
  }

  var hideSelectionReminder = function () {
    $('.without-selection').show();
    $('.with-selection').hide();
  }

  function initializePage() {
    // Initial range detection for when the page is loaded
    handleHashChange();

    // Allow shift clicking links to expand the highlight range
    lineNumberContainer.on('click', 'a', function(event) {
      event.preventDefault();
      if(event.shiftKey) {
        expandRangeToElement($(event.target), lineNumberContainer);
      } else {
        setHash($(event.target).attr('href'));
      }
      handleHashChange(false);
    });

    $(window).on('hashchange', function(event) {
      event.preventDefault();
      // The url was updated with a new range
      handleHashChange();
    });

    $(document).on('keydown', function(event) {
      // Filter out key events when the user has focused an input field.
      if($(event.target).is('input,textarea'))
        return;
      // Filter out key if a modifier is pressed.
      if(event.altKey || event.ctrlKey || event.metaKey)
        return;
      processKeyEvent(event);
    });

    $(document).mouseup(function() {
      var selectedText = getSelectedText();
      if(selectedText) {
        showSelectionReminder(selectedText);
      } else {
        hideSelectionReminder();
      }
    });

    initializeActionButtons($('.header .header-actions'));
  }

  // The native browser handling of hashes in the location is to scroll
  // to the element that has a name matching the id. We want to prevent
  // this since we want to take control over scrolling ourselves, and the
  // most reliable way to do this is to hide the elements until the page
  // has loaded. We also need defer our own scroll handling since we can't
  // access the geometry of the DOM elements until they are visible.
  setTimeout(function() {
    lineNumberContainer.css({display: 'block'});
    initializePage();
  }, 1);
}

module.exports = {
  init: init
}


/***/ })
/******/ ]);