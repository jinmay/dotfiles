local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		-- "javascript",
		-- "typescript",
		-- "tsx",
		"toml",
		"json",
		"yaml",
		"css",
		-- "html",
		-- "htmldjango",
		"lua",
		"python",
		"csv",
		-- "styled",
	},
	autotag = {
		enable = true,
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

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
