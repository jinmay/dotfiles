require("venv-selector").setup({
	parents = 0,
	name = "versions",

	settings = {
		search = {
			pyenv_virtualenv = {
				command = "FD 'versions/(.+)/bin/python$' ~/.pyenv/versions --full-path --color never -E /proc",
			},
		},
	},
})

-- -- Auto select virtualenv Nvim open
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	desc = "Auto select virtualenv Nvim open",
-- 	pattern = "*",
-- 	callback = function()
-- 		local venv = vim.fn.findfile(".python-version", vim.fn.getcwd() .. ";")
-- 		if venv ~= "" then
-- 			require("venv-selector").retrieve_from_cache()
-- 		end
-- 	end,
-- 	once = true,
-- })
