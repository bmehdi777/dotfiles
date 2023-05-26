vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use "wbthomason/packer.nvim"

	-- LSP File config
	use({
		"neovim/nvim-lspconfig", requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}})
	use "jose-elias-alvarez/null-ls.nvim"
	use "MunifTanjim/prettier.nvim"

	-- Theme
	use "folke/tokyonight.nvim"
	--use { "ellisonleao/gruvbox.nvim" }

	-- Telescope
	use { 
		"nvim-telescope/telescope.nvim", tag = '0.1.0', 
		requires = { {"nvim-lua/plenary.nvim"} } -- required by nvim-telescope
	}

	-- Tree
	use "nvim-tree/nvim-tree.lua"

	-- Color syntax
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	-- Completion - cmp
	use "L3MON4D3/LuaSnip" -- Snippet for cmp
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/nvim-cmp" -- Completion plugin
	use "hrsh7th/cmp-path" -- Path completions
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-nvim-lsp" 
	use "hrsh7th/cmp-nvim-lsp-signature-help" 
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Git sugar
	use "lewis6991/gitsigns.nvim"

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
	}

	-- Cheatsheet
	use {
		'sudormrfbin/cheatsheet.nvim',

		requires = {
			{'nvim-telescope/telescope.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		}
	}


	-- Shortcut 
	use {
		'ThePrimeagen/harpoon',
		requires = {
			{'nvim-lua/plenary.nvim'},
		}
	}

	-- Other
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use "windwp/nvim-ts-autotag"
	use "mbbill/undotree"

	use "lewis6991/impatient.nvim"

end)
