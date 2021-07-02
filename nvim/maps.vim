
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

