return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local tree = require("nvim-tree")
		tree.setup({
			renderer = {
				icons = {
					show = {
						file = false,
						folder = false,
						folder_arrow = false,
						git = false
					}
				}
			},
			view = {
				adaptive_size = true
			}
		})
	end
}
