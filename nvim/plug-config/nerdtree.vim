" exit vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" close nerdtree after open a file
let NERDTreeQuitOnOpen=1
let g:NERDTreeGitStatusUseNerdFonts = 1

map <leader>tt :NERDTreeToggle<CR>
map <leader>tf :NERDTreeFind<cr>
