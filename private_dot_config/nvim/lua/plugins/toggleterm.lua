local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-t>]],
	direction = "horizontal",
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

	-- 상하좌우 이동
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

local trim_spaces = true

local function send(mode)
	require("toggleterm").send_lines_to_terminal(mode, trim_spaces, { args = vim.v.count })
end

vim.keymap.set({ "x", "v" }, "<space>s", function()
	send("visual_selection")
end, { desc = "Send visual selection to terminal" })
vim.keymap.set({ "x", "v" }, "<space>S", function()
	send("visual_lines")
end, { desc = "Send visual lines to terminal" })

-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

local grp = vim.api.nvim_create_augroup("ToggleTermKeymaps", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
	group = grp,
	pattern = "term://*toggleterm#*",
	callback = function()
		set_terminal_keymaps()
	end,
})
