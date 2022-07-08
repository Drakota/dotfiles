local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local events_status_ok, nvim_tree_events = pcall(require, "nvim-tree.events")
if not events_status_ok then
    return
end

local state_status_ok, bufferline_state = pcall(require, "bufferline.state")
if not state_status_ok then
    return
end

nvim_tree.setup({
    actions = {
        open_file = {
            resize_window = true
        }
    }
})

nvim_tree_events.on_tree_open(function()
    bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function()
    bufferline_state.set_offset(0)
end)
