(module modules.git
  {autoload {nvim aniseed.autoload}})

(defn plugins
  [use]
  (use :lewis6991/gitsigns.nvim {}))

(defn setup
  []
  (let [(ok? gitsign) (pcall #(require :gitsigns))]
    (when ok?
      (gitsign.setup {}))))
