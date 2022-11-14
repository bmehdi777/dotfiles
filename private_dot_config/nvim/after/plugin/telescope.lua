local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local nnoremap = require("common/keymap").nnoremap

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<esc>"] = actions.close
			},
			n = {
				["<esc>"] = actions.close,
			},
		}
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
}

nnoremap("<C-p>", "<cmd>Telescope find_files<CR>")
nnoremap("<C-f>", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>gb", "<cmd>Telescope git_branches<CR>")
nnoremap("<leader>gc", "<cmd>Telescope git_commits<CR>")
