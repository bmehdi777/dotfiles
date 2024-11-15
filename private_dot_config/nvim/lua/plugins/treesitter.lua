return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		auto_install = true,
		ensure_installed = {
			"lua",
			"rust",
			"toml",
			"query",
			"javascript",
			"typescript",
			"json",
			"markdown",
			"sql",
			"yaml",
			"html",
			"css",
			"go",
			"c"
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
	},
	config = function(_, opts)
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup(opts)
	end
}
