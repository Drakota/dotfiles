vim.cmd "colorscheme default"

local colorscheme = "github_dark_default"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Failed to load colorscheme " .. colorscheme)
end

require("github-theme").setup({
  colors = { bg_sidebar = "#010409", border = "#30363d", bg_visual = "#30363d" }
})

vim.cmd "highlight! BorderBG guibg=NONE guifg=#30363d"
vim.cmd "highlight! NormalFloat guibg=#161b22 guifg=NONE"
