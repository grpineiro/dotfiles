
let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <C-/> I//<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>f2 :PlugInstall<cr>
nnoremap <leader>f3 :PlugUpdate<cr>

" -- LSP Saga keymaps
"Hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>

"Signature help
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>

"Async LSP Finder
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

"Rename
nnoremap <silent>gr :Lspsaga rename<CR>

"Open/Close Terminal
nnoremap <silent> <C-t> :Lspsaga open_floaterm<CR>
tnoremap <silent> <C-t> <C-\><C-n>:Lspsaga close_floaterm<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" -- Telescope

" Basics
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <silent> ;b <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>

" Git
nnoremap <silent> ;gc <cmd>Telescope git_commits<cr>
nnoremap <silent> ;gb <cmd>Telescope git_branches<cr>

