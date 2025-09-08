-- ruff LSP 전역 차단
do
	local orig_start = vim.lsp.start
	if type(orig_start) == "function" then
		vim.lsp.start = function(cfg)
			local name = cfg and cfg.name or ""
			local cmd = cfg and cfg.cmd or {}
			local cmd0 = (type(cmd) == "table") and cmd[1] or cmd
			if name == "ruff" or tostring(cmd0):match("[/\\]?ruff$") then
				return nil -- 시작 자체 차단
			end
			return orig_start(cfg)
		end
	end

	local orig_start_client = vim.lsp.start_client
	vim.lsp.start_client = function(cfg)
		local name = cfg and cfg.name or ""
		local cmd = cfg and cfg.cmd or {}
		local cmd0 = (type(cmd) == "table") and cmd[1] or cmd
		if name == "ruff" or tostring(cmd0):match("[/\\]?ruff$") then
			return -1
		end
		return orig_start_client(cfg)
	end
end

local lspconfig = require("lspconfig")
local lsp_zero = require("lsp-zero")

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

local cmp = require("cmp")
local luasnip = require("luasnip")

-- === LSP 중복/포맷 제어: 추가 ===
local function _disable_lsp_formatting(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		-- 모든 LSP의 포맷 기능 비활성(포맷은 Conform이 맡도록)
		_disable_lsp_formatting(client)
	end,
})

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

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-----------------------
------- cmp -----------
-----------------------

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
		"pyright",
		"ts_ls",
	},
	handlers = {
		-- lsp_zero.default_setup,
		-- 기본: 나머지는 lsp-zero가 처리
		function(server)
			if server == "ruff" or server == "ruff_lsp" then
				return -- ruff LSP는 설정하지 않음
			end
			lsp_zero.default_setup(server)
		end,
	},
})

mason_tool_installer.setup({
	ensure_installed = {
		-- lua
		"stylua",

		-- python
		"pyright",
		-- "ruff",
		-- "ty",

		-- js/ts
		"prettier",
		"typescript-language-server",
	},
})
