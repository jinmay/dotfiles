local wk = require("which-key")
local ai_utils = require("utils.ai")
local avante = require("avante.api")

-- Normal
wk.add({
	{ "<S-Down>", ":resize -2<CR>", desc = "Decrease height", remap = false },
	{ "<S-Left>", ":vertical resize -2<CR>", desc = "Decrease width", remap = false },
	{ "<S-Right>", ":vertical resize +2<CR>", desc = "Increase width", remap = false },
	{ "<S-Up>", ":resize +2<CR>", desc = "Increase height", remap = false },
	-- neotest
	{
		"<leader>ts",
		"<cmd>lua require('neotest').summary.toggle()<cr>",
		desc = "Toggle Summary (Neotest)",
		remap = false,
	},
	{
		"<leader>tr",
		"<cmd>lua require('neotest').run.run()<cr>",
		desc = "Run Nearest (Neotest)",
		remap = false,
	},
	{
		"<leader>tl",
		"<cmd>lua require('neotest').run.run_last()<cr>",
		desc = "Run Last (Neotest)",
		remap = false,
	},
	{
		"<leader>tt",
		"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
		desc = "Run File (Neotest)",
		remap = false,
	},
	{
		"<leader>tT",
		"<cmd>lua require('neotest').run.run(vim.uv.cwd())<cr>",
		desc = "Run All Test Files (Neotest)",
		remap = false,
	},
	{
		"<leader>to",
		"<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>",
		desc = "Show Output (Neotest)",
		remap = false,
	},
	{
		"<leader>tO",
		"<cmd>lua require('neotest').output_panel.toggle()<cr>",
		desc = "Toggle Output Panel (Neotest)",
		remap = false,
	},
	{
		"<leader>tS",
		"<cmd>lua require('neotest').run.stop()<cr>",
		desc = "Stop (Neotest)",
		remap = false,
	},
	{
		"<leader>tw",
		"<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
		desc = "Toggle Watch (Neotest)",
		remap = false,
	},
	-- dap
	{ "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "DAP breakpoint", remap = false },
	{ "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", desc = "DAP Step Out", remap = false },
	{ "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "DAP Continue", remap = false },
	{ "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "DAP Step Over", remap = false },
	{ "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "DAP Step Into", remap = false },
	{ "<leader>e", ":NvimTreeToggle<cr>", desc = "Toggle NvimTree", remap = false },
	-- telescope
	{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files", remap = false },
	{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find buffers", remap = false },
	{ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live Grep", remap = false },
	{ "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "Grep string", remap = false },
	{ "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", desc = "Quickfix", remap = false },
	-- git
	{ "<leader>gg", require("utils.git").toggle_fugitive, desc = "Git status", remap = false },
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

	-- quicknotes
	{ "<leader>qn", ":Quicknotes<CR>", desc = "Open quicknotes" },
	{
		"<leader>td",
		function()
			require("dooing.ui").toggle_todo_window()
		end,
		desc = "Open quicknotes",
	},
})

-- Insert
wk.add({
	mode = "i",
	{ "jk", "<ESC>", desc = "Escape", remap = false },
})

-- Visual
wk.add({
	mode = "v",
	{
		{
			"<leader>ar",
			function()
				avante.ask({ question = ai_utils.avante_code_readability_analysis })
			end,
			desc = "Code Readability Analysis(ask)",
		},
		{
			"<leader>ae",
			function()
				avante.ask({ question = ai_utils.avante_explain_code })
			end,
			desc = "Explain Code(ask)",
		},
		{
			"<leader>ao",
			function()
				avante.ask({ question = ai_utils.avante_optimize_code })
			end,
			desc = "Optimize Code(ask)",
		},
		{
			"<leader>au",
			function()
				avante.ask({ question = ai_utils.avante_add_tests })
			end,
			desc = "Add Tests(ask)",
		},
		{ "<", "<gv", desc = "Indent left", remap = false },
		{ ">", ">gv", desc = "Indent right", remap = false },
		{ "J", ":m '>+1<CR>gv=gv", desc = "Move block down", remap = false },
		{ "K", ":m '<-2<CR>gv=gv", desc = "Move block up", remap = false },
		{ "p", '"_dP', desc = "Paste", remap = false },
		{ "zo", ":foldopen!<CR>", desc = "Open all folds in selection", remap = false },
		{ "am", ":foldopen!<CR>", desc = "Open all folds in selection", remap = false },
	},
})
