local status, neoai = pcall(require, "neoai")
if not status then
	print("Failed to load NeoAI:", neoai)
	return
end

neoai.setup({
	models = {
		{
			name = "openai",
			model = "gpt-4.1-mini",
			params = nil,
		},
	},
	open_ai = {
		api_key = {
			env = "OPENAI_AVANTE_API_KEY",
		},
	},
	shortcuts = {
		{
			name = "gitcommit",
			key = "<leader>ag",
			desc = "Generate git commit message",
			use_context = false,
			prompt = function()
				return require("utils.ai").generate_commit_message("English")
			end,
			modes = { "n" },
			strip_function = nil,
		},
	},
})
