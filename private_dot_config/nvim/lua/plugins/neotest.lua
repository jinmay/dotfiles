local status, neotest = pcall(require, "neotest")
if not status then
	return
end

neotest.setup({
	adapters = {
		require("neotest-python")({
			args = { "--log-level", "DEBUG", "--nomigrations" },
			-- args = { "--log-level", "DEBUG" },
			runner = "pytest",
		}),
	},
})
