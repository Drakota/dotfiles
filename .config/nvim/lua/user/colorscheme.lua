vim.cmd "colorscheme default"

local colorscheme = "nightfly"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Failed to load colorscheme " .. colorscheme)
end

vim.cmd "highlight VertSplit ctermbg=NONE guibg=NONE"
