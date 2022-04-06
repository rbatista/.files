(module key-mappings
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

; n - normal mode
; i - insert mode
; v - visual mode
; c - command mode
; t - terminal mode

; map - recursive mapping
; noremap - Non recursive mapping

; set leaders
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(nvim.set_keymap :n :<space> :<nop> {:noremap true})

; quit easily
(nvim.set_keymap :n :<leader>q ":q<CR>" {:noremap true :silent true})
(nvim.set_keymap :n :<leader>Q ":qa!<CR>" {:noremap true :silent true})

(nvim.set_keymap :v :v "<Esc>" {:noremap true})

; Move to the start of line
(nvim.set_keymap :n :H "^" {:noremap true})

; Move to the end of line
(nvim.set_keymap :n :L "$" {:noremap true})

; Redo
(nvim.set_keymap :n :U "<C-r>" {:noremap true})

; Quick command mode
(nvim.set_keymap :n :<CR> ":" {:noremap true})

; Yank to the end of line
(nvim.set_keymap :n :Y "y$" {:noremap true})
