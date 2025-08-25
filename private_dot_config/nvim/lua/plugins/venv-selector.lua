local venv_selector = require("venv-selector")

venv_selector.setup({
	settings = {
		search = {
			pyenv_virtualenv = {
				command = "FD 'versions/(.+)/bin/python$' ~/.pyenv/versions --full-path --color never -E /proc",
			},
		},
	},
})
