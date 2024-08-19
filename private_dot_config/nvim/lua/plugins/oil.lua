return {
	"stevearc/oil.nvim",
	config = function ()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			columns = {
				"icon"
			},
			keymaps = {
				["<leader>o"] = "actions.close"
			}
		})
	end
}
