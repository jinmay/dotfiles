require("nvim_aider").setup({
	aider_cmd = "aider",
	-- Command line arguments passed to aider
	args = {
		"--no-auto-commits",
		"--pretty",
		"--stream",
	},
	-- Theme colors (automatically uses Catppuccin flavor if available)
	theme = {
		user_input_color = "#a6da95",
		tool_output_color = "#8aadf4",
		tool_error_color = "#ed8796",
		tool_warning_color = "#eed49f",
		assistant_output_color = "#c6a0f6",
		completion_menu_color = "#cad3f5",
		completion_menu_bg_color = "#24273a",
		completion_menu_current_color = "#181926",
		completion_menu_current_bg_color = "#f4dbd6",
	},
	-- snacks.picker.layout.Config configuration
	picker_cfg = {
		preset = "vscode",
	},
	-- Other snacks.terminal.Opts options
	config = {
		os = { editPreset = "nvim-remote" },
		gui = { nerdFontsVersion = "3" },
	},
	win = {
		wo = { winbar = "Aider" },
		style = "nvim_aider",
		position = "right",
	},
})
