local fn = vim.fn

local function not_vscode()
  return not vim.g.vscode
end

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
  use { "ifplusor/packer.nvim", opt = false, branch = "fix-sequencing" }

  use { "nvim-lua/popup.nvim", opt = true, cond = { not_vscode } }
  use { "nvim-lua/plenary.nvim", opt = true, cond = { not_vscode } }
  use { "bluz71/vim-nightfly-guicolors" }
  use { "kyazdani42/nvim-web-devicons", opt = true, cond = { not_vscode } }
  use {
    "romgrk/barbar.nvim",
    opt = true,
    cond = { not_vscode },
    after = "nvim-web-devicons",
    config = function()
      require("user.bufferline")
    end
  }
  use { "nvim-telescope/telescope.nvim", opt = true, cond = { not_vscode } }
  use {
    "nvim-lualine/lualine.nvim",
    opt = true,
    cond = { not_vscode },
    after = "nvim-web-devicons",
    config = function()
      require("user.lualine")
    end
  }
  use {
    "kyazdani42/nvim-tree.lua",
    opt = true,
    cond = { not_vscode },
    after = "nvim-web-devicons",
    config = function()
      require("user.nvim-tree")
    end
  }
  use { "phaazon/hop.nvim", config = function() require("user.hop") end }
  use { "vim-scripts/ReplaceWithRegister" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
