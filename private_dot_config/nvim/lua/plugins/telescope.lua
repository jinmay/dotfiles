local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local status_actions, actions = pcall(require, "telescope.actions")
if not status_actions then
	return
end

local action_state = require("telescope.actions.state")
if not action_state then
	return
end

telescope.setup({
	defaults = {
		path_display = { "truncate" },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = function(prompt_bufnr)
					local picker = action_state.get_current_picker(prompt_bufnr)
					local selections = picker:get_multi_selection()

					-- 선택된 항목이 없다면 동작 취소
					if vim.tbl_isempty(selections) then
						vim.notify("No selections to send to Quickfix", vim.log.levels.WARN)
						return
					end

					-- 선택된 항목을 Quickfix로 추가
					local qf_list = {}
					for _, entry in ipairs(selections) do
						table.insert(qf_list, {
							filename = entry.filename or entry.path,
							lnum = entry.lnum,
							col = entry.col,
							text = entry.text,
						})
					end

					vim.fn.setqflist(qf_list)
					vim.notify("Added " .. #qf_list .. " items to Quickfix")
					actions.close(prompt_bufnr)
				end,
			},
		},
	},
})
