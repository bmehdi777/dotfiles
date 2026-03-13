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
			ts_ls = {
				commands = {
					OrganizeImports = {
						function()
							local params = {
								command = "_typescript.organizeImports",
								arguments = {vim.api.nvim_buf_get_name(0)},
								title = ""
							}
							vim.lsp.buf.execute_command(params)
						end,
						description = "Organize Imports"
					}
				}
			},
			"quick_lint_js",
		}

		require("mason").setup({
			PATH = "append" -- mason binary are added at the end of the path, ensuring that mason take the system lsp first if it encounters it
		})
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		-- force relative import
		vim.lsp.config("ts_ls", {
			init_options = {
				preferences = {
					importModuleSpecifier = "non-relative",
					importModuleSpecifierPreference = "non-relative",
				}
			}
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
			}
		})
		cmp.setup.filetype({ "sql", "mysql" }, {
			sources = {
				{ name = "vim-dadbod-completion"},
				{ name = "buffer" },
			}
		})

		vim.diagnostic.config({
			virtual_lines = false,
			virtual_text = {
				virt_text_pos='eol',
				-- virt_text_pos='eol_right_align', <- when it will be out in the next nvim version (perhaps v.0.12)
			},
		})
	end
}
