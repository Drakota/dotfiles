local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous
      }
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor({
        layout_config = {
          preview_cutoff = 1
        }
      })
    }
  }
})

telescope.load_extension("ui-select")
