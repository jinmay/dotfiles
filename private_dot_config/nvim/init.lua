-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- for VSCode Neovim extension
if vim.g.vscode then
	vim.opt.clipboard = "unnamedplus"

	require("lazy").setup({
		"folke/which-key.nvim",
		"nvim-treesitter",
		"nvim-treesitter-textobjects",
	})
	require("vscode_keymaps")
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"json",
			"yaml",
			"lua",
			"python",
			"toml",
			"css",
			"csv",
		},
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
	require("nvim-treesitter-textobjects")
	vim.highlight.on_yank({ higroup = "Search" })

-- native Neovim
else
	vim.g.mapleader = " "

	require("plugins")

	require("config.options")
	require("config.keymaps")
end
