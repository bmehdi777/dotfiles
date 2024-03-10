return {
	"stevearc/oil.nvim",
	config = function ()
		require("oil").setup({
			columns = {
				"icon"
			},
			keymaps = {
				["<leader>o"] = "actions.close"
			}
		})
	end
}
