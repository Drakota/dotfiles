local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    show_close_icon = false,
    mode = "tabs",
    buffer_close_icon = '',
    close_icon = '',
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    }
  }
})
