local status, quicknote = pcall(require, "nvim-quicknotes")
if not status then
	return
end

quicknote.setup()
