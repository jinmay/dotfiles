local status, trouble = pcall(require, "trouble")
if not status then
	return
end

trouble.setup({
	auto_open = false,
	auto_close = true,
	auto_preview = true,
	auto_fold = true,
	use_lsp_diagnostic_signs = true,
})
