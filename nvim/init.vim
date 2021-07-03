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

let g:nord_contrast = 1
let g:nord_borders = 1
let g:nord_disable_background = 1
colorscheme nord

let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"


au FocusGained * :checktime

