local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")
local dap_virtual_text = require("nvim-dap-virtual-text")

dapui.setup()
dap_virtual_text.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Use python by installed from mason
dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

local function get_python_path()
	local handle = io.popen("pyenv which python")
	-- local handle = io.popen("which python")
	local result = handle:read("*a")
	handle:close()
	return result:gsub("%s+", "")
end

-- For python project
table.insert(dap.configurations.python, {
	name = "Launch with my code",
	type = "python",
	request = "launch",
	justMyCode = false,
	program = "${file}",
})

-- For django project by docker
table.insert(dap.configurations.python, {
	name = "Django runserver by Docker",
	type = "python",
	request = "attach",
	justMyCode = false,
	program = "${file}",
	connect = {
		host = "127.0.0.1",
		port = 5678,
	},
	pathMappings = {
		{
			localRoot = "${workspaceFolder}/",
			remoteRoot = "/app",
		},
	},
	pythonPath = get_python_path(),
})
