(module key-mappings
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

; set leaders
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(nvim.set_keymap :n :<space> :<nop> {:noremap true})
