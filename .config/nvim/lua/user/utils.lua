local M = {}

function M.vscode()
    return vim.g.vscode == 1
end

function M.not_vscode()
    return not vim.g.vscode
end

function M.keymap(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
