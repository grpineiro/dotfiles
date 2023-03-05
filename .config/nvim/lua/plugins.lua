local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local status, packer = pcall(require, 'packer')
if not status then
  print("Packer is not installed.")
  return
end
--vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  -- LSP
  use { "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "nvim-lua/lsp-status.nvim",
  }

  use { "glepnir/lspsaga.nvim" }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'tjdevries/colorbuddy.nvim' }
  use { 'nvim-lualine/lualine.nvim' }

  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  use { 'nvim-lua/popup.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'onsails/lspkind-nvim' }

  -- Themes
  use 'navarasu/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use {
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp'
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets'
  }

  -- Telescope
  use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-github.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  }

  use { 'tpope/vim-fugitive' }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use 'numToStr/Comment.nvim'

  -- Lisp enviroment
  use {
    'monkoose/nvlime',
    requires = {'monkoose/parsley'},
  }
  use 'gpanders/nvim-parinfer' -- Specific autopairs for Lisp.

  -- Null-ls - Diagnostics
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Codium
  use 'Exafunction/codeium.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)
