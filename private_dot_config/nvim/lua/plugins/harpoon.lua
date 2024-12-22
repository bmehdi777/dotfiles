return {
	"ThePrimeagen/harpoon",
	dependencies = {
		{'nvim-lua/plenary.nvim'}
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup({
			menu = {
				width = 100
			}
		})
	end
}
