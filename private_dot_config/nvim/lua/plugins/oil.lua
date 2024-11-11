return {
	"stevearc/oil.nvim",
	opts = {
		float = {
			padding = 2,
			max_width = 80,
			max_height = 20,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- preview_split: Split direction: "auto", "left", "right", "above", "below".
			preview_split = "auto",
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},
		view_options = {
			show_hidden = true,
		},
		columns = {
			"icon"
		},
		keymaps = {
			["<leader>o"] = "actions.close",
			["<C-h>"] = "actions.close",
			["<C-j>"] = "actions.close",
			["<C-k>"] = "actions.close",
			["<C-l>"] = "actions.close",
			["<esc>"] = "actions.close",
		}
	}
}
