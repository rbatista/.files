(module plugins.treesitter
  {autoload {nvim aniseed.nvim}})

(let [(ok? config) (pcall #(require :nvim-treesitter.configs))]
  (when ok?
    (config.setup
      {:ensure_installed ["clojure" "fennel" "java" "lua" "scala"]
       :highlight {:enable true
                   :additional_vim_regex_highlighting false}
       :rainbow {:enable true}})))
