local lualine = require("lualine")

lualine.setup({
	options = {
		theme = "jellybeans",
		disabled_filetypes = { "NvimTree" },
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{
				"filename",
				symbols = {
					modified = "[+]",
					readonly = "[-]",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
			},
		},
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				diagnostics_color = {
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
				},
				colored = true,
				update_in_insert = false,
				always_visible = false,
			},
		},
		lualine_c = { "mode" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
