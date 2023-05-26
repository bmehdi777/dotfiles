local status, harpoon = pcall(require, "harpoon")
if not status then
	return
end

harpoon.setup({
	menu = {
		width = 100
	}
})
