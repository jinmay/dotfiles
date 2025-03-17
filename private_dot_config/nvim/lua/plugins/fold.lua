local ufo = require("ufo")

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- folded 배경색 변경
vim.cmd([[highlight Folded guibg=null]])

-- keymap
vim.keymap.set("n", "zN", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)

-- setup
ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
