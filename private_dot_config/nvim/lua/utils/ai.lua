local M = {}

-- prefil edit window with common scenarios to avoid repeating query and submit immediately
M.prefill_edit_window = function(request)
	require("avante.api").edit()
	local code_bufnr = vim.api.nvim_get_current_buf()
	local code_winid = vim.api.nvim_get_current_win()
	if code_bufnr == nil or code_winid == nil then
		return
	end
	vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
	-- Optionally set the cursor position to the end of the input
	vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
	-- Simulate Ctrl+S keypress to submit
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, true, true), "v", true)
end

M.avante_code_readability_analysis = [[
  You must identify any readability issues in the code snippet.
  Some readability issues to consider:
  - Unclear naming
  - Unclear purpose
  - Redundant or obvious comments
  - Lack of comments
  - Long or complex one liners
  - Too much nesting
  - Long variable names
  - Inconsistent naming and code style.
  - Code repetition
  You may identify additional problems. The user submits a small section of code from a larger file.
  Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
  If there's no issues with code respond with only: <OK>

  Response in Korean.
]]
M.avante_optimize_code = "Optimize the following code. In Korean."
M.avante_explain_code = "Explain the following code. In Korean."
M.avante_add_docstring = "Add docstring to the following codes. In Korean."
M.avante_fix_bugs = "Fix the bugs inside the following codes if any. In Korean."
M.avante_add_tests = "Implement tests for the following code by using pytest. In Korean."

-- neoai for auto commit
M.generate_commit_message = function(language)
	local prompt = [[
    Generate a concise and clear git commit message based on the following git diff.
    The commit message should have:
    - A short title summary (≤ 75 characters)
    - A description following the format: `type: message`
    - The type should be one of: feat, fix, refactor, chore, docs, style, test, perf
  ]] .. " and you should generate commit message in " .. language .. [[:
  ]] .. [[
  ```
  ]] .. vim.fn.system("git diff --cached") .. [[
  ```
  And you shoud give me commit message immediately.
  And you don't need to explain unnecessary things.

  This is an example of a good commit message:
  ```
  feat: add new feature to the code
  ```
  ]]

	return prompt
end

return M
