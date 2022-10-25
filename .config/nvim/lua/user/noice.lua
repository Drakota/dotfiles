local status_ok, noice = pcall(require, "noice")
if not status_ok then
  return
end

noice.setup({
  views = {
    cmdline_popup = {
      size = {
        width = "35%"
      },
      position = {
        row = "100%",
        col = "50%"
      },
      border = {
        style = "none",
        padding = { 0, 0 }
      }
    }
  }
})
