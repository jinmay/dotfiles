local ufo = require("ufo")

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set("n", "zN", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)

-- peek folded lines under cursor
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- local language_servers = require("lspconfig").util._available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
-- 	require("lspconfig")[ls].setup({
-- 		capabilities = capabilities,
-- 		-- you can add other fields for setting up lsp server in this table
-- 	})
-- end

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})

-- folded 배경색 변경
vim.cmd([[highlight Folded guibg=null]])
