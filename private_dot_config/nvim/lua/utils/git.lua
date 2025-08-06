local M = {}

-- Toggle Fugitive window
M.toggle_fugitive = function()
	local winids = vim.api.nvim_list_wins()
	for _, id in pairs(winids) do
		local status = pcall(vim.api.nvim_win_get_var, id, "fugitive_status")
		if status then
			vim.api.nvim_win_close(id, false)
			return
		end
	end
	vim.cmd("Git")
end

-- Helper to get current Git branch name
local function get_current_branch()
	local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
	if not handle then
		return nil
	end
	local branch = handle:read("*l")
	handle:close()
	return branch
end

-- Copy current Git branch name to system clipboard
M.copy_branch = function()
	local branch = get_current_branch()
	if not branch or branch == "" then
		print("⚠️ Git 리포지토리가 아니거나 브랜치를 찾을 수 없습니다.")
		return
	end
	vim.fn.setreg("+", branch)
	print("브랜치명 복사 완료 → " .. branch)
end

return M
