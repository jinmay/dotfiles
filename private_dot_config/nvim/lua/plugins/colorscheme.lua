local colorscheme = "catppuccin-frappe" -- kanagawa, catppuccin, rose-pine

-- require("kanagawa").setup({
-- 	overrides = function(colors)
-- 		return {
-- 			CursorLine = { bg = "#3b4252" },
-- 			Visual = { bg = "#3b4252" }, -- Visual 모드 선택 배경색 설정
-- 		}
-- 	end,
-- })

-- require("rose-pine").setup()
require("catppuccin").setup()

-- telescope 커서 배경색 변경
vim.cmd([[
  highlight TelescopeSelection guibg=#3b4252 guifg=#ffffff
]])
vim.cmd([[
  highlight TelescopePreviewLine guibg=#3b4252 guifg=#ffffff
]])

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
