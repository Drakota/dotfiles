local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- General
  use { "phaazon/hop.nvim", branch = "v2", config = "require('user.hop')" }
  use { "vim-scripts/ReplaceWithRegister" }
  use { "projekt0n/github-nvim-theme" }

  -- Utilities
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "numToStr/Comment.nvim", config = "require('user.comment')" }
  use { "RRethy/vim-illuminate", config = "require('user.illuminate')" }

  -- UI
  use { "kyazdani42/nvim-web-devicons" }
  use { "akinsho/bufferline.nvim", config = "require('user.bufferline')" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope.nvim", config = "require('user.telescope')" }
  use { "nvim-lualine/lualine.nvim", config = "require('user.lualine')" }
  use { "MunifTanjim/nui.nvim" }
  use { "nvim-neo-tree/neo-tree.nvim", config = "require('user.neo-tree')" }
  use { "folke/noice.nvim", config = "require('user.noice')" }

  -- Autocompletion
  use { "L3MON4D3/LuaSnip", }
  use { "rafamadriz/friendly-snippets", }
  use { "hrsh7th/nvim-cmp", config = "require('user.cmp')" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "github/copilot.vim" }

  -- LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig", config = "require('user.lsp')" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = "require('user.treesitter')" }
  use { "nvim-treesitter/playground" }

  -- Autopairs
  use { "windwp/nvim-autopairs", config = "require('user.autopairs')" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
