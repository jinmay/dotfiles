local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	-- indent = {
	-- 	enable = true,
	-- 	disable = {},
	-- },
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"toml",
		"fish",
		"php",
		"json",
		"yaml",
		"css",
		"html",
		"htmldjango",
		"lua",
		"python",
		"csv",
		"styled",
	},
	autotag = {
		enable = true,
		disable = {},
	},
	-- treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
