local wk = require("which-key")

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- split editor
keymap("n", "<leader>sv", "<cmd>lua require('vscode').action('workbench.action.splitEditorRight')<CR>", opts)
keymap("n", "<leader>sh", "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>", opts)
keymap("n", "<leader>sx", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opts)

-- telescope
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap(
	{ "n", "v" },
	"<leader>fw",
	"<cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>"
)

-- git
keymap("n", "<leader>gg", "<cmd>lua require('vscode').action('workbench.view.scm')<CR>", opts)
keymap("n", "<leader>gs", "<cmd>lua require('vscode').action('git.checkout')<CR>", opts)
keymap("n", "<leader>gb", "<cmd>lua require('vscode').action('git.blame.toggleStatusBarItem')<CR>", opts)

-- file explorer
keymap("n", "<leader>e", function()
	require("vscode").action("workbench.action.toggleSidebarVisibility")
end, opts)

-- folding
keymap("n", "zo", function()
	require("vscode").call("editor.toggleFold")
end, opts)
keymap("n", "zM", function()
	require("vscode").call("editor.foldAll")
end, opts)
keymap("n", "zN", function()
	require("vscode").call("editor.unfoldAll")
end, opts)

keymap("n", "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua require('vscode').action('editor.action.rename')<CR>", opts)

wk.add({
	mode = "v",
	{ "<", "<gv", desc = "Indent left", remap = false },
	{ ">", ">gv", desc = "Indent right", remap = false },
	{ "J", ":m '>+1<CR>gv=gv", desc = "Move block down", remap = false },
	{ "K", ":m '<-2<CR>gv=gv", desc = "Move block up", remap = false },
	{ "p", '"_dP', desc = "Paste", remap = false },
})
