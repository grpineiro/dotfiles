runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s") 
endif

runtime ./maps.vim
"}}}

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set autoread
set encoding=UTF-8

syntax on
colorscheme nord

let g:airline_powerline_fonts = 1

au FocusGained * :checktime

