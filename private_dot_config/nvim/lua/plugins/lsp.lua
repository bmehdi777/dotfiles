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

		{
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local servers = {
			"clangd",
			"rust_analyzer",
			"ts_ls",
			"quick_lint_js",
			"gopls",
			"lua_ls"
		}
		local function config(_config)
			return vim.tbl_deep_extend("force", {
				on_attach = on_attach,
			}, _config or {})
		end

		require("mason").setup({
			PATH = "append" -- mason binary are added at the end of the path, ensuring that mason take the system lsp first if it encounters it
		})
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				if server_name == "tsserver" then
					local _conf = {
						capabilities = capabilities,
						commands = {
							OrganizeImports = {
								description = "Organize Imports",
								function()
									local params = {
										command = "_typescript.organizeImports",
										arguments = {vim.api.nvim_buf_get_name(0)},
										title = ""
									}
									vim.lsp.buf.execute_command(params)
								end
							}
						}
					}
					nvim_lsp[server_name].setup(config(_conf))
				else
					nvim_lsp[server_name].setup(config())
				end
			end
		})


		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
			end,
		})

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			preselect = cmp.PreselectMode.None,
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
				{ name = "nvim_lsp"},
				{ name = "nvim_lsp_signature_help"},
				{ name = "path" },
				{ name = "lazydev" },
			}
		})
		cmp.setup.filetype({ "sql", "mysql" }, {
			sources = {
				{ name = "vim-dadbod-completion"},
				{ name = "buffer" },
			}
		})
	end
}
