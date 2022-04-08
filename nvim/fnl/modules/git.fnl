(module modules.git
  {autoload {nvim aniseed.autoload}})

(defn plugins
  [use]
  ; show git changes on ruler
  (use :lewis6991/gitsigns.nvim {})
  ; enale permlink to git repo (github)
  (use :ruifm/gitlinker.nvim {:requires :nvim-lua/plenary.nvim}))

(defn setup
  []
  (let [(ok? gitsign) (pcall #(require :gitsigns))]
    (when ok?
      (gitsign.setup {})))
  (let [(ok? gitlinker) (pcall #(require :gitlinker))]
    (when ok?
      (gitlinker.setup {}))))
