local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

tree.setup({
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = false
			},
		}
	},
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "<C-s>", action="split"}
			}
		}
	}
});

