local Path = require("plenary.path")
local status, neotest = pcall(require, "neotest")
if not status then
	return
end

-- https://github.com/nvim-neotest/neotest-python/blob/master/lua/neotest-python/base.lua#L49
neotest.setup({
	adapters = {
		require("neotest-python")({
			args = { "--log-level", "DEBUG", "--nomigrations" },
			runner = "pytest",
			is_test_file = function(file_path)
				if not vim.endswith(file_path, ".py") then
					return false
				end

				local elems = vim.split(file_path, Path.path.sep)
				local file_name = elems[#elems]

				return file_name == "tests.py"
					or vim.startswith(file_name, "test_")
					or vim.endswith(file_name, "_tests.py")
			end,
		}),
	},
})
