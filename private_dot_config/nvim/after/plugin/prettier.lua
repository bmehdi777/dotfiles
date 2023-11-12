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
		semi = true,
		trailling_coma = "all",
		single_quote = false,
	}
})
