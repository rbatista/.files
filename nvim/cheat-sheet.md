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
| `<localleader>ls` | Open repl log buffer horizontally |
| `<localleader>lv` | Open repl log buffer vertically |
| `<localleader>lt` | Open repl log buffer in new tab |

### Code navigation

| shortcut | What does it do? |
| -------- | ---------------- |
| `K` | Look up documentation for the word under the cursor |
| `gd` | Go to definition of the word under the cursor |

### Tests
| shortcut | What does it do? |
| -------- | ---------------- |
| `<localleader>ta` | Run all currently loaded tests. |
| `<localleader>tn` | Run all within this namespace. |
| `<localleader>tc`   |       Run the specific test under the cursor.