(module general-settings
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

;generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.o.termguicolors true)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")
(set nvim.g.t_Co "256")

;sets a nvim global options
(let [options
      {:termguicolors true
       ;support mouse in all modes (Normal, Visual, Insert, Command)
       :mouse "a"
       :updatetime 500
       :timeoutlen 500
       :inccommand "split"

       ;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"
       ; enable visualization of "hidden" chars
       :list true
       :listchars "tab:»·,trail:·,extends:>,precedes:<,eol:↵"

       ; short message errors
       :shortmess "atOI"
       :scrolljump 5
       :scrolloff 3
       :wrap false
       ; setup tabs as spaces with 2 spaces as default
       :shiftwidth 2
       :tabstop 2
       :softtabstop 2
       :expandtab true

       ; new split window to right or below 
       :splitbelow true
       :splitright true 

       ; hide mouse while typing
       :mousehide true
       ; Allow buffer switching without saving
       :hidden true

       :ruler true
       :relativenumber true
       :cursorline true
       :fillchars "stl: ,stlnc: ,fold: ,vert:│"

       ; match brackets/parenthesis
       :showmatch true
       :matchtime 5

       ; always report changed lines
       :report 0

       :wildignore "*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,*/tmp/*" }]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))
