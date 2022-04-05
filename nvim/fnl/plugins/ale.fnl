(module plugins.ale
  {autoload {nvim aniseed.nvim}})

(set nvim.g.ale_linters
  {:clojure [:clj-kondo]})
