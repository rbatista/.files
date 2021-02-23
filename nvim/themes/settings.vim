hi Comment cterm=italic
let g:nvcode_termcolors=256

syntax on

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" load your prefered theme here
source $HOME/.config/nvim/themes/one.vim
"source $HOME/.config/nvim/themes/sonokai.vim
"source $HOME/.config/nvim/themes/solarized.vim
