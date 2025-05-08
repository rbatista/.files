(module init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             treesitter modules.treesitter
             ui modules.ui
             lsp modules.lsp
             autocomplete modules.autocomplete
             clojure modules.lang.clojure
             telescope modules.telescope
             git modules.git
             term modules.terminal}})

(require :general-settings)
(require :plugins)
(require :key-mappings)

;import plugin.fnl
(treesitter.setup)
(telescope.setup)
(term.setup)
(clojure.setup)
(autocomplete.setup)
(lsp.setup)
(git.setup)
(ui.setup)
