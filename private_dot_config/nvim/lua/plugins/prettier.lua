return {
	"MunifTanjim/prettier.nvim",
	dependencies = {
		{"jose-elias-alvarez/null-ls.nvim"}
	},
	config = function()
		local prettier = require("prettier")
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
	end
}
