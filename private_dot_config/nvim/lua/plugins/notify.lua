local status, notify = pcall(require, "notify")
if not status then
	print("failed to load notify")
end

notify.setup({
	stages = "slide",
	timeout = 3000,
})
