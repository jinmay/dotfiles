local lspconfig = require("lspconfig")
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	local keymap = vim.keymap
	local opts = { noremap = true, silent = true }

	opts.buffer = bufnr

	opts.desc = "Show LSP references"
	keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

	-- opts.desc = "Show LSP definitions"
	-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

	opts.desc = "Show LSP incoming calls"
	keymap.set("n", "gci", "<cmd>Telescope lsp_incoming_calls<CR>", opts)

	opts.desc = "Show LSP outgoing calls"
	keymap.set("n", "gco", "<cmd>Telescope lsp_outgoing_calls<CR>", opts)

	opts.desc = "Go to lsp declaration"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

	opts.desc = "Go to lsp implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	-- opts.desc = "Show LSP type definitions"
	-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

	opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>dl", vim.diagnostic.open_float, opts)

	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

	opts.desc = "Smart rename"
	keymap.set("n", "<leader>rn", ":IncRename ", opts)
end)

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-----------------------
------- cmp -----------
-----------------------
local cmp = require("cmp")
local luasnip = require("luasnip")

-- friendly snippet
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
		["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

-----------------------
------- mason----------
-----------------------
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
		-- "pyright",
		"ruff",
		"ty",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

mason_tool_installer.setup({
	ensure_installed = {
		-- lua
		"stylua",

		-- python
		-- "pyright",
		"ruff",
		"ty",

		-- js/ts
		"prettier",
	},
})
