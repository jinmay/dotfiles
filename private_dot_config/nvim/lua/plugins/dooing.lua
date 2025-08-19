local status, dooing = pcall(require, "dooing")
if not status then
	return
end

dooing.setup({})
