local status, dressing = pcall(require, "dressing")
if not status then
	print("Error loading dressing: " .. dressing)
end

dressing.setup({})
