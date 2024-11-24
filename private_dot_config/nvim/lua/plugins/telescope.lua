local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local status_actions, actions = pcall(require, "telescope.actions")
if not status_actions then
	return
end

telescope.setup({
	defaults = {
		path_display = { "truncate" },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			},
		},
	},
})
