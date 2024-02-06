return {
	"nvim-telescope/telescope.nvim", 
	tag = '0.1.3',
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")


		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-s>"] = actions.select_horizontal,
						["<esc>"] = actions.close,
					},
					n = {
						["<esc>"] = actions.close,
					}
				}
			}
		})

		local telescope_builtin = require("telescope.builtin")
		local vnoremap = require("core/keymap").vnoremap
		local func = require("core/functions")
		vnoremap("<C-f>", function()
			local text = func.getVisualSelection()
			telescope_builtin.live_grep({ default_text = text })
		end, { silent=true })
	end
}
