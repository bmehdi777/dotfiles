return {
	"MunifTanjim/prettier.nvim",
	dependencies = {
		{"jose-elias-alvarez/null-ls.nvim"}
	},
	opts = {
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
	}
}
