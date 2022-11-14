local status, cmp = pcall(require, "cmp")
if not status then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["C-k"] = cmp.mapping.select_prev_item(),
		["C-j"] = cmp.mapping.select_next_item(),
		["<leader><CR>"] = cmp.mapping.confirm { select = true },
	}
})
