local status, theme = pcall(require, "tokyonight")
if not status then
	return
end

theme.setup({
	style = "night",
	styles = {
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = {
		"qf",
		"vista_kind",
		"terminal",
		"packer",
		"spectre_panel",
		"help"
	},
	on_colors = function(colors)
		colors.border = "#302033"
	end,

})

theme.load()

