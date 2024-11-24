local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local status_ok2, api = pcall(require, "nvim-tree.api")
if not status_ok2 then
	return
end

-- Automatically open file upon creation
-- api.events.subscribe(api.events.Event.FileCreated, function(file)
-- 	vim.cmd("edit " .. file.fname)
-- end)

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	update_cwd = false,
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	filters = {
		dotfiles = false,
		custom = {
			"^.git$",
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	trash = {
		cmd = "trash",
	},
})
