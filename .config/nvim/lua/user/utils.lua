local M = {}

function M.vscode()
  return vim.g.vscode == 1
end

function M.not_vscode()
  return not vim.g.vscode
end

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.move_nvimtree(cmd)
  vim.cmd(cmd)

  local nvimtree_status_ok, nvimtree = pcall(require, "nvim-tree")
  if not nvimtree_status_ok then
    return
  end

  local nvimtree_view_status_ok, nvimtree_view = pcall(require, "nvim-tree.view")
  if not nvimtree_view_status_ok then
    return
  end

  if nvimtree_view.is_visible() then
    vim.defer_fn(function()
      nvimtree.toggle(false, true)
      nvimtree.toggle(false, true)
    end, 50)
  end
end

return M
