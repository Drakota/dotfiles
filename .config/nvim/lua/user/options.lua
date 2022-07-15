-- Set tab size
vim.opt.tabstop = 2

-- Set spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Enable line numbers
vim.opt.number = true

-- Enable mouse scrolling in Neovim
vim.opt.mouse = "a"

-- Wrap long lines
vim.opt.wrap = true

-- Force horizontal and vertical splits to go below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes:1"
vim.opt.termguicolors = true
vim.opt.showmode = false

vim.cmd("set clipboard^=unnamed,unnamedplus")
vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
        ["+"] = "win32yank.exe -i",
        ["*"] = "win32yank.exe -i"
    },
    paste = {
        ["+"] = "win32yank.exe -o",
        ["*"] = "win32yank.exe -o"
    },
    cache_enable = 0,
}
