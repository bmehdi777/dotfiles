local status_cmp, cmp = pcall(require, "cmp")
if not status_cmp then
	return
end

local status_luasnip, luasnip = pcall(require, "luasnip")
if not status_luasnip then
	return
end

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
		["<C-Space>"] = cmp.mapping.confirm { select = true },
	},
	sources = {
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lsp"},
		{ name = "buffer"}
	}
})
