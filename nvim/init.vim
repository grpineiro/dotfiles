runtime ./plug.vim
runtime ./maps.vim

if has("unix")
  let s:uname = system("uname -s") 
endif

lua << EOF
  require('config')

EOF

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

syntax enable
colorscheme nord

au FocusGained * :checktime

