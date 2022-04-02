local helpers = vim.fn

-- AutoInstall packer
local install_path = helpers.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if helpers.empty(helpers.glob(install_path)) > 0 then -- if packer.vim doesn't exist
  PACKER_BOOTSTRAP = helpers.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }
  print "Installing packer ! restart Neovim"
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]-- load packer

local status, packer = pcall(require,'packer')
if not status then
  return
end

-- packer popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}

return packer.startup(function(use)

  -- Plugins
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"   -- Popup Api used by many plugins
  use "nvim-lua/plenary.nvim" -- Useful Lua function used by manu plugins
  use "numToStr/Comment.nvim" -- Easy comments
  use "akinsho/toggleterm.nvim" -- toggleTerm terminal


  -- Colorschemes
  use "folke/tokyonight.nvim" -- Colorscheme

  -- Completion
  use "hrsh7th/nvim-cmp" -- Completion plugin
  use "hrsh7th/cmp-buffer" -- Completion from buffer
  use "hrsh7th/cmp-path" -- Completion for paths
  use "hrsh7th/cmp-cmdline" -- Completion for command line
  use "hrsh7th/cmp-nvim-lsp" -- Completion for LSP
  use "hrsh7th/cmp-nvim-lua" -- Completion for nvim lua

  -- Buffers
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye" -- implement Bdelete to replace the regular bdelete

  -- Snippets
  use "L3MON4d3/LuaSnip" -- Snippet engine used by cmp
  use "rafamadriz/friendly-snippets" -- Usefull snippets

  -- LSP
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- Helper lsp installer
  use "jose-elias-alvarez/null-ls.nvim"  -- formatter and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- TreeSitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Nvim-tree
  use "kyazdani42/nvim-web-devicons" -- Icons for nvim-tree
  use "kyazdani42/nvim-tree.lua" -- Actual plugin
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

