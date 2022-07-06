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
  use "wbthomason/packer.nvim" 
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "bluz71/vim-nightfly-guicolors"
  use "kyazdani42/nvim-web-devicons"
  use "romgrk/barbar.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "phaazon/hop.nvim"

  require("hop").setup({
    keys = "etovxqpdygfblzhckisuran"
  })

  require("lualine").setup({
    options = {
      theme = 'auto',
      disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    }
  })

  require("nvim-tree").setup({
    actions = {
      open_file = {
        resize_window = true
      }
    }
  })

  vim.cmd [[colorscheme nightfly]]
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
