local utils = require "user.utils"

local keymap = utils.keymap
local vscode = utils.vscode

-- Normal keymaps
keymap("n", "s", "<Plug>Lightspeed_omni_s")

-- Visual keymaps
-- Continue indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Don't discard register when pasting over visual selection
keymap("v", "p", '"_dP')

if vscode() then
  -- Normal keymaps
  keymap("n", "gb", ":call VSCodeNotify('editor.action.addSelectionToNextFindMatch')<CR>")
  keymap("n", "gc", ":call VSCodeNotify('editor.toggleFold')<CR>")
end

if not vscode() then
  -- Window navigation
  keymap("n", "<C-h>", "<C-w>h")
  keymap("n", "<C-j>", "<C-w>j")
  keymap("n", "<C-l>", "<C-w>l")
  keymap("n", "<C-k>", "<C-w>k")

  -- Resize Windows with arrows
  keymap("n", "<C-Up>", ":resize -2<CR>")
  keymap("n", "<C-Down>", ":resize +2<CR>")
  keymap("n", "<C-Left>", ":vertical resize -2<CR>")
  keymap("n", "<C-Right>", ":vertical resize +2<CR>")

  -- Navigate tabs
  keymap("n", "<S-l>", ":tabnext<CR>")
  keymap("n", "<S-h>", ":tabprevious<CR>")

  -- Open Telescope
  keymap("n", "<C-S-p>", ":Telescope<CR>")
  keymap("n", "<C-p>", ":Telescope find_files<CR>")

  -- Terminal keymaps
  keymap("t", "<Esc>", "<C-\\><C-n>")
end
