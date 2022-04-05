(module init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             treesitter modules.treesitter
             ui modules.ui
             lsp modules.lsp
             autocomplete modules.autocomplete
             clojure modules.lang.clojure
             telescope modules.telescope}})

(require :general-settings)
(require :plugins)
(require :key-mappings)

;import plugin.fnl
(treesitter.setup)
(telescope.setup)
(clojure.setup)
(autocomplete.setup)
(lsp.setup)
(ui.setup)
