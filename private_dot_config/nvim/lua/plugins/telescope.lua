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
				vimgrep_arguments = {
					'rg',
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
					'--hidden' -- thats the new thing
				},
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
		local telescope_utils = require("telescope.utils")
		local vnoremap = require("core/keymap").vnoremap
		local func = require("core/functions")
		vnoremap("<C-f>", function()
			local text = func.getVisualSelection()
			telescope_builtin.live_grep({ default_text = text, cwd = telescope_utils.buffer_dir() })
		end, { silent=true })
		vnoremap("<C-p>", function()
			local text = func.getVisualSelection()
			telescope_builtin.find_files({ default_text = text, cwd = telescope_utils.buffer_dir() })
		end, { silent=true})
	end
}
