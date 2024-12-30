if has("gui_running")  
   colorscheme murphy  
else  
   colorscheme pablo  
endif 

"colorscheme murphy

"no textwrap        
set nowrap

"set highlighting while searching
set hlsearch

set ignorecase

set ruler

"display number
set number

"spaces for tabs and whitespaces for tabs and indents
set shiftwidth=2            
set tabstop=4
set expandtab

"moving scroll with lines
set scrolloff=5

"256 colors terminal option
set t_Co=256

"file history
if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"autosave file
"set updatetime=1000
"autocmd CursorHold,CursorHoldI <buffer> silent update

execute pathogen#infect()
syntax on
filetype plugin indent on

"plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
