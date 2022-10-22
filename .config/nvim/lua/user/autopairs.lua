local autopairs_status_ok, autopairs = pcall(require, "nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
if not autopairs_status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

autopairs.setup({
  check_ts = true
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
