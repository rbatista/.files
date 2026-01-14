(module modules.eca
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(defn plugins
  [use]
  (use :editor-code-assistant/eca-nvim
       {:requires [:MunifTanjim/nui.nvim  ; UI framework
                   :nvim-lua/plenary.nvim ; async ops
                   :folke/snacks.nvim]})) ; Picker

(defn setup
  []
  (let [(ok? eca) (pcall #(require :eca))]
    (when ok?
      (eca.setup {}))))
