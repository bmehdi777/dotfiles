local status, cmp = pcall(require, "cmp")
if not status then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()


cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
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
		{ name = "nvim_lsp"}
	}
})
