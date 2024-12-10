local status, hardtime = pcall(require, "hardtime")
if not status then
	return
end

hardtime.setup({
	disable_mouse = false,
	restriction_mode = "hint",
	restricted_keys = {
		["h"] = {},
		["j"] = {},
		["k"] = {},
		["l"] = {},
		["-"] = {},
		["+"] = {},
		["gj"] = {},
		["gk"] = {},
		["<CR>"] = {},
		["<C-M>"] = {},
		["<C-N>"] = {},
		["<C-P>"] = {},
	},
	disabled_keys = { ["<Up>"] = {}, ["<Down>"] = {}, ["<Left>"] = {}, ["<Right>"] = {} },
})
