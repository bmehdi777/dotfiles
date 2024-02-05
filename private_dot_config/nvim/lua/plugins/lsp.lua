return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip"},
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-path"},
		{ "hrsh7th/cmp-buffer"},
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "rafamadriz/friendly-snippets"},
	},
	config = function()
		local servers = {
			"clangd",
			"rust_analyzer",
			"tsserver",
			"quick_lint_js",
		}

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm { select = false },
			},
			sources = {
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "nvim_lsp"},
				{ name = "nvim_lsp_signature_help"}
			}
		})
	end
}
