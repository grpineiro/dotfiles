
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

" -- LSP Saga keymaps
"Hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>

"Signature help
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>

"Async LSP Finder
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

"Autocomplete
set completeopt=menuone,noinsert,noselect

"Rename
nnoremap <silent>gr :Lspsaga rename<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" -- Telescope
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

