require("img-clip").setup({
	default = {
		embed_image_as_base64 = false,
		prompt_for_file_name = false,
		drag_and_drop = {
			insert_mode = true,
		},
	},
})

require("render-markdown").setup({
	file_types = { "markdown", "Avante" },
})

require("avante_lib").load()
require("avante").setup({
	provider = "copilot",
	auto_suggestions_provider = "copilot",
	copilot = {
		endpoint = "https://api.githubcopilot.com",
		model = "gpt-4o",
		proxy = nil,
		allow_insecure = false,
		timeout = 30000,
		temperature = 0,
		max_tokens = 4096,
	},
	openai = {
		endpoint = "https://api.openai.com/v1",
		model = "gpt-4o-mini",
		api_key_name = "OPENAI_AVANTE_API_KEY",
		timeout = 30000,
		temperature = 0,
		max_tokens = 4096,
		["local"] = false,
	},
	gemini = {
		endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
		model = "gemini-1.5-flash-latest",
		api_key_name = "GEMINI_API_KEY",
		timeout = 30000,
		temperature = 0,
		max_tokens = 4096,
		["local"] = false,
	},
})
