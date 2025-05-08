(module modules.terminal
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(defn plugins
  [use]
  (use :akinsho/toggleterm.nvim {}))

(defn setup
  []
  (let [(ok? toggleterm) (pcall #(require :toggleterm))]
    (when ok?
      (toggleterm.setup
        {:open_mapping :<C-\>}))))
