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
  keymap("n", "<C-S-o>", ":Telescope lsp_document_symbols<CR>")
  keymap("n", "<C-t>", ":Telescope lsp_workspace_symbols<CR>")

  -- Terminal keymaps
  keymap("t", "<Esc>", "<C-\\><C-n>")

  -- LSP keymaps
  keymap("n", "gd", "<cmd>:Telescope lsp_definitions<CR>")
  keymap("n", "gH", "<cmd>:Telescope lsp_references<CR>")
  keymap("n", "gi", "<cmd>:Telescope lsp_implementations<CR>")
  keymap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
  keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
  keymap("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  keymap("n", "gq", "<cmd>lua MOVE_NVIMTREE('lua vim.lsp.diagnostic.set_loclist()')<CR>")
  keymap("n", "gQ", "<cmd>lua MOVE_NVIMTREE('lua vim.lsp.diagnostic.set_qflist()')<CR>")
  keymap("n", "gA", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  keymap("n", "gT", "<cmd>:Telescope lsp_type_definitions<CR>")
  keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
  -- Change the default keymap for formatting
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
