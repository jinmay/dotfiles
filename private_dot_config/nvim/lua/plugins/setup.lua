require("lazy").setup({
	-- tmux with vim
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- colorscheme
	-- themes
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- base
	"folke/which-key.nvim",
	"nvim-lua/plenary.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	"nvim-tree/nvim-tree.lua",
	{ "numToStr/Comment.nvim", lazy = false },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "akinsho/toggleterm.nvim", version = "*" },
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- LSP
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"neovim/nvim-lspconfig",
	{ "VonHeikemen/lsp-zero.nvim" },
	{ "smjonas/inc-rename.nvim" },

	-- Mason
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},

	-- python
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		branch = "regexp",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	"nvim-neotest/neotest-python",

	-- debugger
	{ "mfussenegger/nvim-dap", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "theHamsta/nvim-dap-virtual-text" },
	"mfussenegger/nvim-dap-python",

	-- git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- AI
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	-- {
	-- 	"GeorgesAlkhouri/nvim-aider",
	-- 	cmd = {
	-- 		"AiderTerminalToggle",
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>a/", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
	-- 		{ "<leader>as", "<cmd>AiderTerminalSend<cr>", desc = "Send to Aider", mode = { "n", "v" } },
	-- 		{ "<leader>ac", "<cmd>AiderQuickSendCommand<cr>", desc = "Send Command To Aider" },
	-- 		{ "<leader>ab", "<cmd>AiderQuickSendBuffer<cr>", desc = "Send Buffer To Aider" },
	-- 		{ "<leader>a+", "<cmd>AiderQuickAddFile<cr>", desc = "Add File to Aider" },
	-- 		{ "<leader>a-", "<cmd>AiderQuickDropFile<cr>", desc = "Drop File from Aider" },
	-- 	},
	-- 	dependencies = {
	-- 		"folke/snacks.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	-- "catppuccin/nvim",
	-- 	},
	-- 	config = true,
	-- },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},
	{ "TaDaa/vimade", event = "VeryLazy" },
	-- {
	-- 	"davmacario/nvim-quicknotes",
	-- 	keys = { "<leader>qn" },
	-- 	cmd = { "Quicknotes", "QuicknotesClear", "QuicknotesCleanup" },
	-- },
	{
		"tzachar/highlight-undo.nvim",
		config = function()
			require("highlight-undo").setup({})
		end,
	},
	{ "atiladefreitas/dooing" },
	{
		"Bryley/neoai.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	"rcarriga/nvim-notify",

	-- {
	-- 	"folke/lazydev.nvim",
	-- 	ft = "lua",
	-- 	opts = {
	-- 		library = {
	-- 			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	-- 		},
	-- 	},
	-- },
})
