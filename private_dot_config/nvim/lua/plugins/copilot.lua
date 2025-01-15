local copilot = require("copilot")
local suggestion = require("copilot.suggestion")

copilot.setup({
	suggestion = {
		enable = true,
		auto_trigger = true,
		keymap = {
			accept = "<Tab>",
			accept_word = "<C-w>",
			accept_line = "<C-l>",
			next = "<C-]>",
			-- prev = "<C-]>",
			-- dismiss = "<C-]>",
		},
	},
	filetypes = {
		yaml = true,
	},
})

-- Insert 모드에서 Tab 키를 조건부로 매핑
vim.keymap.set("i", "<Tab>", function()
	if suggestion.is_visible() then
		suggestion.accept()
	else
		return "<Tab>"
	end
end, { expr = true, silent = true })
