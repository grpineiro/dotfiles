call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'APZelos/blamer.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'OmniSharp/omnisharp-vim'
Plug 'chriskempson/base16-vim'
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-fugitive' 

call plug#end()

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

let g:blamer_enabled = 1
let g:airline_powerline_fonts = 1

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <C-/> I//<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>f2 :PlugInstall<cr>
nnoremap <leader>f3 :PlugUpdate<cr>

"VIM-fugitive config keys.
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

au FocusGained * :checktime

"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json',
  \ 'coc-clangd',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-elixir',
  \ 'coc-emmet', 
  \ 'coc-solargraph',
  \ 'coc-rust-analyzer'
  \ ]

" Coc - Neovim Configuration
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}

" Show Documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


nnoremap <C-t> :NERDTreeToggle<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

