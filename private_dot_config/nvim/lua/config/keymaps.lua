local wk = require("which-key")
local copilot_chat = require("plugins.copilot-chat")
local harpoon = require("harpoon")

-- toggle git status command
local toggle_fugitive = function()
	local winids = vim.api.nvim_list_wins()
	for _, id in pairs(winids) do
		local status = pcall(vim.api.nvim_win_get_var, id, "fugitive_status")
		if status then
			vim.api.nvim_win_close(id, false)
			return
		end
	end
	vim.cmd("Git")
end

-- Normal
wk.add({
	{ "<S-Down>", ":resize -2<CR>", desc = "Decrease height", remap = false },
	{ "<S-Left>", ":vertical resize -2<CR>", desc = "Decrease width", remap = false },
	{ "<S-Right>", ":vertical resize +2<CR>", desc = "Increase width", remap = false },
	{ "<S-Up>", ":resize +2<CR>", desc = "Increase height", remap = false },
	{ "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "DAP breakpoint", remap = false },
	{ "<leader>d", group = "Neotest & DAP", remap = false },
	{ "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", desc = "DAP Step Out", remap = false },
	{ "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "DAP Continue", remap = false },
	{
		"<leader>df",
		"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
		desc = "Test Class",
		remap = false,
	},
	{ "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "DAP Step Into", remap = false },
	{ "<leader>dm", "<cmd>lua require('neotest').run.run()<cr>", desc = "Test Method", remap = false },
	{ "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "DAP Step Over", remap = false },
	{ "<leader>ds", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Test Summary", remap = false },
	{ "<leader>e", ":NvimTreeToggle<cr>", desc = "Toggle NvimTree", remap = false },
	-- telescope
	-- {
	-- 	"<leader>f",
	-- 	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>",
	-- 	desc = "Find files with dropdown",
	-- 	remap = false,
	-- },
	{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files", remap = false },
	{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find buffers", remap = false },
	{ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live Grep", remap = false },
	{ "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "Grep string", remap = false },
	-- git
	{ "<leader>gg", toggle_fugitive, desc = "Git status", remap = false },
	{ "<leader>gc", ":G commit<cr>", desc = "Git commit", remap = false },
	{ "<leader>ga", ":G commit --amend<cr>", desc = "Git commit --amend", remap = false },
	{ "<leader>gp", ":G push<cr>", desc = "Git push", remap = false },
	{ "<leader>gfm", ":G pull<cr>", desc = "Git pull", remap = false },
	{ "<leader>gr", ":G rebase", desc = "Git rebase", remap = false },
	{ "<leader>gm", ":G merge", desc = "Git merge", remap = false },
	{ "<leader>gb", ":G blame<cr>", desc = "Git blame", remap = false },
	{ "<leader>gs", ":G switch", desc = "Git switch", remap = false },
	{ "<leader>gnb", ":G switch -c ", desc = "New branch & switch", remap = false },
	-- window
	{ "<leader>se", "<C-w>=", desc = "Equalize window size", remap = false },
	{ "<leader>sh", "<C-w>s", desc = "Split window horizontally", remap = false },
	{ "<leader>sv", "<C-w>v", desc = "Split window vertically", remap = false },
	{ "<leader>sx", ":close<CR>", desc = "Close current window", remap = false },
	-- python venv
	{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select python venv", remap = false },
	-- trouble
	{ "<leader>x", group = "Trouble", remap = false },
	{
		"<leader>xb",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
		remap = false,
	},
	{
		"<leader>xl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "Trouble lsp references",
		remap = false,
	},
	{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble Quickfix", remap = false },
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble", remap = false },

	-- buffer
	{ "[b", ":BufferLineCyclePrev<CR>", desc = "Previous Buffer", remap = false },
	{ "]b", ":BufferLineCycleNext<CR>", desc = "Next Buffer", remap = false },
	{ "zo", "za", desc = "Toggle fold", remap = false },

	-- copilot chat
	-- open copilot chat in vertical split
	{
		"<leader>at",
		":CopilotChatToggle<cr>",
		desc = "CopilotChat - Toggle",
		remap = false,
	},
	{
		"<leader>aq",
		copilot_chat.quick_chat,
		desc = "CopilotChat - Quick chat",
		remap = false,
	},
	{
		"<leader>as",
		":CopilotChatStop<cr>",
		desc = "CopilotChat - Stop",
		remap = false,
	},
	{
		"<leader>oa",
		":lua AiderOpen()<cr>",
		desc = "Aider - Open",
		remap = false,
	},

	-- harpoon
	-- {
	-- 	"<leader>aa",
	-- 	function()
	-- 		harpoon.toggle_telescope(harpoon.harpoon.list())
	-- 	end,
	-- 	desc = "harpoon quick menu",
	-- },
	{
		"<leader>A",
		function()
			harpoon:list():add()
		end,
		desc = "harpoon file",
	},
	{
		"<leader>1",
		function()
			harpoon:list():select(1)
		end,
		desc = "harpoon to file 1",
	},
	{
		"<leader>2",
		function()
			harpoon:list():select(2)
		end,
		desc = "harpoon to file 2",
	},
	{
		"<leader>3",
		function()
			harpoon:list():select(3)
		end,
		desc = "harpoon to file 3",
	},
	{
		"<leader>4",
		function()
			harpoon:list():select(4)
		end,
		desc = "harpoon to file 4",
	},
	{
		"<leader>5",
		function()
			harpoon:list():select(5)
		end,
		desc = "harpoon to file 5",
	},
})

-- Insert
wk.add({
	mode = "i",
	{ "jk", "<ESC>", desc = "Escape", remap = false },

	-- copilot
	{ "<C-w>", "<Plug>(copilot-accept-word)", desc = "Accept Copilot suggestion word" },
	{ "<C-l>", "<Plug>(copilot-accept-line)", desc = "Accept Copilot suggestion line" },
	{ "<C-]>", "<Plug>(copilot-next)", desc = "Next Copilot suggestion" },
	-- { "<C-[>", "<Plug>(copilot-previous)", desc = "Previous Copilot suggestion" },
	-- this makes keymap conflict with default vim esc
})

-- Visual
wk.add({
	mode = "v",
	{
		{ "<", "<gv", desc = "Indent left", remap = false },
		{ ">", ">gv", desc = "Indent right", remap = false },
		{ "J", ":m '>+1<CR>gv=gv", desc = "Move block down", remap = false },
		{ "K", ":m '<-2<CR>gv=gv", desc = "Move block up", remap = false },
		{ "p", '"_dP', desc = "Paste", remap = false },
		{ "zo", ":foldopen!<CR>", desc = "Open all folds in selection", remap = false },
		{ "am", ":foldopen!<CR>", desc = "Open all folds in selection", remap = false },
		{
			"<leader>ax",
			":CopilotChatInline<cr>",
			desc = "CopilotChat - Inline chat",
		},
		{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
		{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
		{ "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
		{ "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
	},
})
