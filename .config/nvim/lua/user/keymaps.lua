local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal keymaps
keymap("n", "s", ":HopWord<CR>")

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize Windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Open Telescope
keymap("n", "<C-S-p>", ":Telescope<CR>")
keymap("n", "<C-p>", ":Telescope find_files<CR>")

-- Visual keymaps

-- Terminal keymaps
keymap("t", "<Esc>", "<C-\\><C-n>")

-- Continue indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Don't discard register when pasting over visual selection
keymap("v", "p", '"_dP')
