load_highlighter = function() {
  hljs.initHighlightingOnLoad();
}

Event.observe(window, 'load', load_highlighter)