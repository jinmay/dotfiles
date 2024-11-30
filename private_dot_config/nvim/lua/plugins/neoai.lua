local status, neoai = pcall(require, "neoai")
if not status then
	print("Failed to load NeoAI:", neoai)
	return
end

neoai.setup({
	models = {
		{
			name = "openai",
			model = "gpt-4o-mini",
			params = nil,
		},
	},
	shortcuts = {
		{
			name = "gitcommit",
			key = "<leader>ag",
			desc = "Generate git commit message",
			use_context = false,
			prompt = require("utils.ai").generate_commit_message("English"),
			modes = { "n" },
			strip_function = nil,
		},
	},
})
