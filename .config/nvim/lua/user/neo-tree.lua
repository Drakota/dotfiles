local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neo_tree.setup({
  close_if_last_window = true,
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      hide_dotfiles = false
    }
  },
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function(args)
        if args.open_cmd == "tabnew" then
          vim.defer_fn(function()
            neo_tree.show("filesystem")
          end, 0)
        end
      end
    },
  },
  default_component_configs = {
    modified = {
      symbol = "",
      highlight = "NeoTreeModified",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        modified  = "",
        deleted   = "✖",
        renamed   = "",
        -- Status type
        untracked = "N",
        ignored   = "I",
        unstaged  = "U",
        staged    = "S",
        conflict  = "C",
      }
    },
  }
})
