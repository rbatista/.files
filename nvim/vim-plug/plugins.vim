" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Specify your required plugins here.
Plug 'liuchengxu/vim-better-default'
Plug 'easymotion/vim-easymotion'

" Support to syntax highlight of a lot of langs
Plug 'sheerun/vim-polyglot'

Plug 'guns/vim-sexp', { 'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure'}
Plug 'tpope/vim-repeat', { 'for': 'clojure'}
Plug 'tpope/vim-surround', { 'for': 'clojure'}
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }

Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'

" Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'
"
" smart as vscode + lsp support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" disable highlight after search
Plug 'romainl/vim-cool'

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" repl + autocomplete by nrepl + cider
Plug 'Olical/conjure'

" run commands in background"
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" Jack in to Boot, Clj & Leiningen from Vim
Plug 'clojure-vim/vim-jack-in'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" themes
Plug 'sainnhe/sonokai'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-solarized8'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

Plug 'Yggdroot/indentLine'

" vertical selection
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'Shougo/echodoc.vim'
" Initialize plugin system.
call plug#end()
