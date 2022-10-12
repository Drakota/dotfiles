local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  open_on_setup = true,
  open_on_tab = true,
  ignore_buffer_on_setup = true,
  update_focused_file = {
    enable = true
  },
  actions = {
    open_file = {
      resize_window = true
    }
  }
})

