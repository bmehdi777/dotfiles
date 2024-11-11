return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		renderer = {
			root_folder_label = false,
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = false,
					git = true
				}
			}
		},
		on_attach = function(bufnr)
			local api = require "nvim-tree.api"

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set('n', '<Esc>', api.tree.close, opts('Close'))
		end,
		view = {
			adaptive_size = true,
			side = "right"
		}
	}
}
