return {
	"nvimtools/none-ls.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				{
					name = "Organize imports",
					method = null_ls.methods.CODE_ACTION,
					filetypes = { "typescript" },
					generator = {
						fn = function()
							return {
								{
									title = "Organize imports",
									action = function()
										vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0)}})
									end
								}
							}
						end
					},
				},
				null_ls.builtins.formatting.prettier,
			}
		})
	end
}
