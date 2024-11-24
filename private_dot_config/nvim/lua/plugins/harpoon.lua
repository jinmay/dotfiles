local harpoon = require("harpoon")

harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

-- harpoon:extend({
-- 	UI_CREATE = function(cx)
-- 		vim.keymap.set("n", "<C-v>", function()
-- 			harpoon.ui:select_menu_item({ vsplit = true })
-- 		end, { buffer = cx.bufnr })
--
-- 		vim.keymap.set("n", "<C-x>", function()
-- 			harpoon.ui:select_menu_item({ split = true })
-- 		end, { buffer = cx.bufnr })
--
-- 		vim.keymap.set("n", "<C-t>", function()
-- 			harpoon.ui:select_menu_item({ tabedit = true })
-- 		end, { buffer = cx.bufnr })
-- 	end,
-- })

-- keymap
vim.keymap.set("n", "<leader>aa", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

return {
	harpoon = harpoon,
	toggle_telescope = toggle_telescope,
}
