(module modules.treesitter
  {autoload {nvim aniseed.nvim}})

(defn plugins
  [import-plugin]
  (import-plugin :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"})
  (import-plugin :HiPhish/rainbow-delimiters.nvim {}))

(defn setup
  []
  (let [(ok? config) (pcall #(require :nvim-treesitter.configs))]
    (when ok?
      (config.setup
        {:ensure_installed ["clojure" "fennel" "java" "lua" "scala"]
         :highlight {:enable true
                     :additional_vim_regex_highlighting false}
         :rainbow {:enable true}}))))

