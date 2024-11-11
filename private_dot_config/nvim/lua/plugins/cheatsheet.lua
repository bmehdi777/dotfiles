return {
	"sudormrfbin/cheatsheet.nvim",
	dependencies = {
		{ 'nvim-telescope/telescope.nvim' },
		{ 'nvim-lua/popup.nvim' },
		{ 'nvim-lua/plenary.nvim' },
	},
	opts = {
		bundled_cheatsheets = false,
		bundled_plugin_cheatsheets = false,
		include_only_installed_plugins = false,
	}
}
