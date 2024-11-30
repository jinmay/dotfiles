local status, vimade = pcall(require, "vimade")
if not status then
	return
end

vimade.setup({
	fadelevel = function(style, state)
		if style.win.buf_opts.syntax == "NvimTree" then
			return 0.9
		else
			return 0.7
		end
	end,
})
