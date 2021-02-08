# NVIM Cheat sheet

> Default leader = "Space"
> 
> Default local leader = ","

## Vim basics
| shortcut | Mode | What does it do? |
|----|-------|
| `Ctrl + o` | Normal | Jump back to the previous location |
| `Ctrl + i` | Normal | Jump forward to the next locations |
| `<Leader>j` | Normal | Go to jump (it will open the jump list) |
| `<Leader>u` | Normal | Go page up |
| `<Leader>d` | Normal | Go page down |

https://github.com/liuchengxu/vim-better-default/wiki/a-brief-introduction-to-key-bindings

## Clojure
https://github.com/guns/vim-sexp
### Edition
| shortcut | What does it do? |
|----|-------|
| `daf` / `dsf`   | Delete a form |
| `dif`     | Delete the inner form |
| `yaf`     | Copy form |
| `yif`     | Copy the inner form |
| `=-`      | Format the top form |
| `<LocalLeader>h` | Insert at the begin of the current form |
| `<LocalLeader>l` | Insert at the end of the current form |
| `<Leader>W`      | Surround with parentheses and insert at begin of it |
| `cse(` | Surround with parentheses |
| `cse[` | Surround with brackets |
| `cse{` | Surround with braces |
| `<I` | Insert at the beginning of a form |
| `>I` | Insert at the ending of a form |
| `>)` and `<)`| Slurpage |
| `>f` | Move form forward |
| `<f` | Move form backward |
| `>e` | Move element forward |
| `<e` | Move element backward |
| `<Leader>t` | Swap element forward |
| `<Leader>T` | Swap element backward |
| `<LocalLeader>o`  | Raise a form | 
| `<Leader>'`  | Raise a element | 
| `<leader>rn` | Rename (LSP) |
| `<leader>a<move>` | Code action (LSP), for example fix import for the current word: `<leader>aiw` |
| `cram` | Add missing lib spec |
| `crcn` | Clean namespace |

### Movements
| shortcut | What does it do? |
|----|-------|
| `af` / `if`   | Outer / inner form (list) |
| `aF` / `iF`   | Outer / inner outermost form (top list) |
| `as` / `iS`   | Outer / inner string |
| `ae` / `aw` / `ie` / `iw` | Outer / inner element / word |

### Repl (Conjure)
| shortcut | What does it do? |
|----|-------|
| `:Lein`     | Open a lein repl on a new window |
| `<leader>rs` | Open a lein repl on a buffer (`:Dispatch lein repl`) |
| `<leader>rb` | Open a lein repl on a buffer in background (`:Dispatch! lein repl`) |
| `<localleader>cf` | Connect the conjure to a repl by .nrepl-port |
| `<localleader>eb` | Evaluate the current buffer |
| `<localleader>ee` | Evaluate the inner form under the cursor |
| `<localleader>er` | Evaluate the root form under the cursor |
| `<localleader>e!` | Evaluate a form and replace it with the result |
| `<localleader>em[mark]` | Evaluate a form at a mark. Use `m[mark]` to set the mark, use capital letters between different files |
| `<localleader>eiw` | Evaluate a word |
| `<localleader>E` | Evaluate visual selection | 
| `<localleader>E[motion]`| Evaluate any give motion, eg. `<localleader>Eiw` evaluate a word |
| `<localleader>Eaf` | Evaluate a form |
| `<localleader>EaF` | Evaluate a top form |
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
| `gr` | Go to reference of the word under the cursor |

### Tests
| shortcut | What does it do? |
| -------- | ---------------- |
| `<localleader>ta` | Run all currently loaded tests. |
| `<localleader>tn` | Run all within this namespace. |
| `<localleader>tc`   | Run the specific test under the cursor. |