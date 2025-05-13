require("render-markdown").setup({
	file_types = { "markdown", "Avante" },
})

require("avante_lib").load()
require("avante").setup({
	provider = "openai",
	auto_suggestions_provider = "openai",
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
		model = "gpt-4.1",
		api_key_name = "OPENAI_AVANTE_API_KEY",
		timeout = 30000,
		temperature = 0,
		max_tokens = 8192,
	},
})
