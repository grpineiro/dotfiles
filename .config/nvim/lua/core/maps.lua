vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.keymap.set

-- Open Terminal in split bottom
map("n", "<leader>tj", ":belowright split<bar>term<CR>")

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

-- DAP --
map("n", "<leader>d", "<cmd>lua require('dapui').toggle()<CR>", { silent = true })

-- Telescope --
-- Basics
map("n", ";f", ":Telescope find_files<CR>", { silent = true })
map("n", ";r", ":Telescope live_grep<CR>", { silent = true })
map("n", ";l", ":Telescope buffers<CR>", { silent = true })
map("n", ";;", ":Telescope help_tags<CR>", { silent = true })
map("n", ";b", ":Telescope file_browser<CR>", { silent = true })
map("n", ";dd", ":Telescope diagnostics<CR>", { silent = true })

-- Git
map("n", ";gc", ":Telescope git_commits<CR>", { silent = true })
map("n", ";gb", ":Telescope git_branches<CR>", { silent = true })

-- Compiler Infra --
-- Open compiler
map('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Toggle output resume
map('n', '<S-F6>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

map("n", "<leader>]", ":Gen<CR>")

return map
