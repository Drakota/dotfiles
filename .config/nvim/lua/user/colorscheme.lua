vim.cmd "colorscheme default"

local colorscheme = "github_dark_default"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Failed to load colorscheme " .. colorscheme)
end

require("github-theme").setup({
  colors = { border = "#30363d", bg_visual = "#30363d" }
})

vim.cmd "highlight! NeoTreeNormal guibg=#010409"
vim.cmd "highlight! NeoTreeNormalNC guibg=#010409"
vim.cmd "highlight! NoiceCmdlinePopup guibg=#0a0e12"
vim.cmd "highlight! NoiceCmdlineIconCmdline guifg=#d2a8ff"

vim.fn.sign_define("DiagnosticSignError",
  { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "", texthl = "DiagnosticSignHint" })
