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

				["aa"] = "@parameter.outer", -- 인자 전체 (argument outer)
				["ia"] = "@parameter.inner", -- 인자 내부 (argument inner)

				["al"] = "@loop.outer", -- 루프 전체 (for, while 등)
				["il"] = "@loop.inner", -- 루프 본문만

				["ai"] = "@conditional.outer", -- if/else 같은 조건문 전체
				["ii"] = "@conditional.inner", -- 조건문 내부만
			},
		},
	},
})

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
