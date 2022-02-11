local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'
  }

  use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' }
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
  use { 'shaunsingh/nord.nvim' }

  use {
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

  use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-github.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  }

  use { 'tpope/vim-fugitive' }

  use 'andweeb/presence.nvim'

  use 'numToStr/Comment.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)
