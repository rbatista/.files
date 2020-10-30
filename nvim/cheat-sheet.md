# NVIM Cheat sheet

> Default leader = "Space"
> 
> Default local leader = ","

## Clojure
### Repl (Conjure)
| shortcut | What does it do? |
|----|-------|
| `:Lein`     | Open a lein repl on a new window |
| `<leader>r` | Open a lein repl on a buffer (`:Dispatch lein repl`) |
| `:ConjureConnect` | Connect the conjure to a repl by .nrepl-port |
| `<localleader>eb` | Evaluate the current buffer |
| `<localleader>ee` | Evaluate the inner form under the cursor |
| `<localleader>er` | Evaluate the root form under the cursor |
| `<localleader>e!` | Evaluate a form and replate it with the result |
| `<localleader>em[mark]` | Evaluate a form at a mark. Use `m[mark]` to set the mark, use capital letters between different files |
| `<localleader>ew` | Evaluate a word |
| `<localleader>E` | Evaluate visual selection | 
| `<localleader>E[motion]`| Evaluate any give motion, eg. `<localleader>Eiw` evaluate a word |
| `<localleader>Ea(` | Evaluate a form |
| `K` | Look up documentation for the word under the cursor |
| `gd` | Go to definition of the word under the cursor |




You can open the log buffer in a few ways:
Horizontally - <localleader>ls
Vertically - <localleader>lv
New tab - <localleader>lt