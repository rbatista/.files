(module modules.lang.clojure
  {autoload {nvim aniseed.nvim}})

(defn plugins
  [use]
  (use :Olical/conjure {;:ft ["clojure" "fennel"]
                        :requires ["Olical/AnsiEsc" "tami5/compe-conjure"]})
  (use :guns/vim-sexp {})
  (use :tpope/vim-sexp-mappings-for-regular-people {}))

(defn setup []
  (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))
