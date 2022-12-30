vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.keymap.set

-- Open Terminal in split bottom
map("n", "<leader>tj", ":belowright split<bar>term<CR>")

-- LSP Saga --
-- Hover doc
map("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })

-- Signature help
map("i", "<C-k>", ":Lspsaga signature_help<CR>", { silent = true })

-- Async LSP finder
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

--Code actions
map("n", "ga", "<Cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
map("n", "gr", ":Lspsaga rename<CR>", { silent = true })

-- CMP --
-- Navigate through popup menu
map("i", "<expr><Tab>", 'pumvisible() ? "<C-n>" : "<Tab>')
map("i", "<expr><S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>')

-- Fugitive --
map("n", "<leader>gh", ":diffget //3<CR>")
map("n", "<leader>gu", ":diffget //2<CR>")
map("n", "<leader>gs", ":G<CR>")

-- LuaSnip --
map("i", "<M-k>", "<cmd>lua require('luasnip').jump(1)<CR>")
map("i", "<M-j>", "<cmd>lua require('luasnip').jump(-1)<CR>")

-- Telescope --
-- Basics
map("n", ";f", ":Telescope find_files<CR>", { silent = true })
map("n", ";r", ":Telescope live_grep<CR>", { silent = true })
map("n", ";l", ":Telescope buffers<CR>", { silent = true })
map("n", ";;", ":Telescope help_tags<CR>", { silent = true })
map("n", ";b", ":Telescope file_browser<CR>", { silent = true })

-- Git
map("n", ";gc", ":Telescope git_commits<CR>", { silent = true })
map("n", ";gb", ":Telescope git_branches<CR>", { silent = true })

return map
