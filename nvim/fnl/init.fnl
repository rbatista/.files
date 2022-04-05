(module init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             treesitter modules.treesitter}})

(require :general-settings)
(require :plugins)
(require :key-mappings)

;import plugin.fnl
(treesitter.setup)
