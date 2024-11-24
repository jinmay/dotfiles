local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works. Please answer in Korean.",
	Review = "Please review the following code and provide suggestions for improvement. Please answer in Korean.",
	Tests = "Please explain how the selected code works, then generate unit tests for it by using pytest. Please answer in Korean.",
	Refactor = "Please refactor the following code to improve its clarity and readability and more advanced concept. Please answer in Korean.",
	FixCode = "Please fix the following code to make it work as intended. Please answer in Korean.",
	FixError = "Please explain the error in the following text and provide a solution. Please answer in Korean.",
	BetterNamings = "Please provide better names for the following variables and functions. Please answer in Korean, new name in English.",
	Documentation = "Please provide documentation for the following code. Please answer in Korean.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger. Please answer in Korean.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger. Please answer in Korean.",

	-- Text related prompts
	Summarize = "Please summarize the following text. Please answer in Korean.",
	Spelling = "Please correct any grammar and spelling errors in the following text. Please answer in Korean.",
	Wording = "Please improve the grammar and wording of the following text. Please answer in Korean.",
	Concise = "Please rewrite the following text to make it more concise. Please answer in Korean.",
}

local chat = require("CopilotChat")
local select = require("CopilotChat.select")
local opts = {
	prompts = prompts,
	auto_follow_cursor = false,
	chat_autocomplete = true,
	mappings = {
		reset = {
			normal = "<C-r>",
			insert = "<C-r>",
		},
		-- submit_prompt = {
		-- 	normal = "<CR>",
		-- 	insert = "<CR>",
		-- },
	},
}
chat.setup(opts)
-- require("CopilotChat.integrations.cmp").setup()

local function quick_chat()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end

-- Buffer chat with Copilot
vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
	chat.ask(args.args, { selection = select.visual })
end, { nargs = "*", range = true })

-- Inline chat with Copilot
vim.api.nvim_create_user_command("CopilotChatInline", function(args)
	chat.ask(args.args, {
		selection = select.visual,
		window = {
			layout = "float",
			relative = "cursor",
			width = 1,
			height = 0.4,
			row = 1,
		},
	})
end, { nargs = "*", range = true })

return {
	quick_chat = quick_chat,
}
