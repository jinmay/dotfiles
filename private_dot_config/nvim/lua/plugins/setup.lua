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
	"jose-elias-alvarez/null-ls.nvim",

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
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
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
	"folke/neodev.nvim",
	"nvim-neotest/neotest-python",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- debugger
	{ "mfussenegger/nvim-dap", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "theHamsta/nvim-dap-virtual-text" },
	"mfussenegger/nvim-dap-python",

	-- git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	"github/copilot.vim",
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
	},

	-- AI
	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	lazy = false,
	-- 	version = false,
	-- 	build = "make BUILD_FROM_SOURCE=true",
	-- 	dependencies = {
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		-- "zbirenbaum/copilot.lua",
	-- 		{
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 		},
	-- 		{
	-- 			-- Make sure to set this up properly if you have lazy=true
	-- 			"MeanderingProgrammer/render-markdown.nvim",
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- },
	-- { "joshuavial/aider.nvim" },

	-- ETC
	-- {
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},
	{ "TaDaa/vimade", event = "VeryLazy" },
	{
		"davmacario/nvim-quicknotes",
		keys = { "<leader>qn" },
		cmd = { "Quicknotes", "QuicknotesClear", "QuicknotesCleanup" },
	},
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
})
