vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use "wbthomason/packer.nvim"

	-- LSP File config
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}})

	-- Theme
	use "folke/tokyonight.nvim"

	-- Telescope
	use { 
		"nvim-telescope/telescope.nvim", tag = '0.1.0', 
		requires = { {"nvim-lua/plenary.nvim"} } -- required by nvim-telescope
	}

	-- Tree
	use "nvim-tree/nvim-tree.lua"

	-- Completion - cmp
	use "L3MON4D3/LuaSnip" -- Snippet for cmp
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/nvim-cmp" -- Completion plugin
	use "hrsh7th/cmp-path" -- Path completions
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-nvim-lsp" 
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Git sugar
	use "lewis6991/gitsigns.nvim"

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
	}

	-- Other
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use "lewis6991/impatient.nvim"

end)
