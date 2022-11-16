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
	}
});

