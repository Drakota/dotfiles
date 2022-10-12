local utils = require "user.utils"

local not_vscode = utils.not_vscode
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
  opt_default = true,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use { "ifplusor/packer.nvim", opt = false, branch = "fix-sequencing" }

  -- General
  use { "ggandor/lightspeed.nvim", opt = false }
  use { "vim-scripts/ReplaceWithRegister", opt = false }
  use { "projekt0n/github-nvim-theme", opt = false }

  -- Utilities
  use { "nvim-lua/popup.nvim", cond = { not_vscode } }
  use { "nvim-lua/plenary.nvim", cond = { not_vscode } }
  use { "numToStr/Comment.nvim", config = "require('user.comment')", cond = { not_vscode } }

  -- UI
  use { "kyazdani42/nvim-web-devicons", cond = { not_vscode } }
  use { "akinsho/bufferline.nvim", config = "require('user.bufferline')", cond = { not_vscode } }
  use { "nvim-telescope/telescope.nvim", cond = { not_vscode } }
  use { "nvim-lualine/lualine.nvim", config = "require('user.lualine')", cond = { not_vscode } }
  use { "kyazdani42/nvim-tree.lua", config = "require('user.nvim-tree')", cond = { not_vscode } }

  -- Autocompletion
  use { "L3MON4D3/LuaSnip", event = "VimEnter", cond = { not_vscode } }
  use { "rafamadriz/friendly-snippets", event = "VimEnter", cond = { not_vscode } }
  use { "hrsh7th/nvim-cmp", after = "LuaSnip", event = "VimEnter", config = "require('user.cmp')", cond = { not_vscode } }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp", event = "VimEnter", cond = { not_vscode } }
  use { "hrsh7th/cmp-path", after = "nvim-cmp", event = "VimEnter", cond = { not_vscode } }
  use { "hrsh7th/cmp-cmdline", after = "nvim-cmp", event = "VimEnter", cond = { not_vscode } }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", event = "VimEnter", cond = { not_vscode } }
  use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp", event = "VimEnter", cond = { not_vscode } }
  use { "github/copilot.vim", cond = { not_vscode } }

  -- LSP
  use { "williamboman/mason.nvim", cond = { not_vscode } }
  use { "williamboman/mason-lspconfig.nvim", after = "mason.nvim", cond = { not_vscode } }
  use { "neovim/nvim-lspconfig", after = "mason-lspconfig.nvim", config = "require('user.lsp')", cond = { not_vscode } }

  -- Formatting
  use { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig", cond = { not_vscode } }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
