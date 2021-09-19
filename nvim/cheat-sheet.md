# NVIM Cheat sheet

> Default leader: `Space`
> 
> Default local leader: `,`

## Vim basics
| shortcut | Mode | What does it do? |
| ---- | ------- | ------ |
| `Ctrl + o` | Normal | Jump back to the previous location |
| `Ctrl + i` | Normal | Jump forward to the next locations |
| `<Leader>j` | Normal | Go to jump (it will open the jump list) |
| `<Leader>u` | Normal | Go page up |
| `<Leader>d` | Normal | Go page down |
| `dt[char]` | Normal | Delete until next character `[char]` (not included) |
| `dT[char]` | Normal | Delete until previous character `[char]` (not included) |
| `df[char]` | Normal | Delete until next character `[char]` (included) |
| `dF[char]` | Normal | Delete until previous character `[char]` (included) |

https://github.com/liuchengxu/vim-better-default/wiki/a-brief-introduction-to-key-bindings

## Clojure
https://github.com/guns/vim-sexp
### Edition
| shortcut | What does it do? |
|----|-------|
| `daf`     | Delete a form |
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
| `ysaf)` | Surround the current form with parentheses |
| `<Leader>W` | Surround current element with parentheses and change to insert mode |
| `>)` and `<)`| Slurpage |
| `>f` | Move form forward |
| `<f` | Move form backward |
| `>e` | Move element forward |
| `<e` | Move element backward |
| `<Leader>t` | Swap element forward |
| `<Leader>T` | Swap element backward |
| `<LocalLeader>@` | `dsf` | Splice the current form into its parent |
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

## Nerdtree
| shortcut | What does it do? |
| -------- | ---------------- |
| `tt` | Toggle NerdTree. |
| `tf` | Open NerdTree on current file. |
| `ma` | On nerdtree > Add a file on the selected directory |
| `mm` | On nerdtree > Move the selected file |
| `s` | On nerdtree > Open the selected file in vertical split |
| `i` | On nerdtree > Open the selected file in horizontal split |

## FZF
| shortcut | What does it do? |
| -------- | ---------------- |
| `<Ctrl> + p` | Open file search (use Ag) |
| `:AgIn <path>` | Open file to search from the path (use Ag) |
| `<Ctrl> + x` | [In the file search] Split the buffer horizontally and open the current file in it|
| `<Ctrl> + v` | [In the file search] Split the buffer vertically and open the current file in it|
| `<Ctrl> + t` | [In the file search] Open the current file in a new tab|


## Git
| shortcut | What does it do? |
| -------- | ---------------- |
| `<leader>hs` | Stage hunk over the cursor (works on visual mode) |
| `<leader>hu` | Undo hunk over the cursor (works on visual mode) |
| `<leader>hp` | Preview changes in hunk over the cursor |
