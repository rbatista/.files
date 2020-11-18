# NVIM Cheat sheet

> Default leader = "Space"
> 
> Default local leader = ","

## Vim basics
| shortcut | What does it do? |
|----|-------|
| `Ctrl + o` | Normal mode: Jump back to the previous location |
| `Ctrl + i` | Normal mode: Jump forward to the next locations |
| `<Leader>j` | Go to jump (it will open the jump list) | 

## Clojure

### Edition
| shortcut | What does it do? |
|----|-------|
| `daf`     | Delete a form |
| `dif`     | Delete the inner form |
| `yaf`     | Copy form |
| `yif`     | Copy the inner form |
| `<LocalLeader>h` | Insert at the begin of the current form |
| `<LocalLeader>l` | Insert at the end of the current form |
| `cse(` | Surround with parentheses |
| `cse[` | Surround with brackets |
| `cse{` | Surround with braces |
| `>)` and `<)`| Slurpage |
| `<I` | Insert at the beginning of a form |
| `>I` | Insert at the ending of a form |

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
| `<localleader>rr`  | Refresh all changed namespaces. |
| `<localleader>ra`  | Refresh all namespaces, even unchanged. |
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