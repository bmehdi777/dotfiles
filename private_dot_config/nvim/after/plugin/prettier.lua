local status, prettier = pcall(require, "prettier")
if not status then
	return
end

prettier.setup({
	bin = 'prettier',
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"markdown",
		"yaml"
	},
	cli_options = {
		tab_width = 4,
		use_tabs = true,
		semi = true,
		single_quote = false,
	}
})
