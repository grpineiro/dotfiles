require('plugins_config/cmp')
require('plugins_config/mason')
require('plugins_config/lualine')
require('plugins_config/lsp')
require('plugins_config/dap')
require('plugins_config/lspsaga')
require('plugins_config/lualine')
require('plugins_config/telescope')
require('plugins_config/treesitter')
require('plugins_config/comment')
require('plugins_config/gitsigns')
require('plugins_config/null')

-- Init Plugins
require('nvim-autopairs').setup({
  disable_filetype = {
    "lisp",
  }
})

vim.opt.termguicolors = true
