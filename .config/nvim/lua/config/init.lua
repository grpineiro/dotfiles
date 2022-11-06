require('config/cmp')
require('config/mason')
require('config/lualine')
require('config/lsp')
require('config/lspsaga')
require('config/lualine')
require('config/telescope')
require('config/treesitter')
require('config/comment')
require('config/gitsigns')
require('config/null')
require('config/conjure')

-- Init Plugins
require('nvim-autopairs').setup({
  disable_filetype = {
    "lisp",
  }
})

vim.opt.termguicolors = true
