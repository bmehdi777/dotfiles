local status, theme = pcall(require, "tokyonight")
if not status then
	return
end
-- test
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
		colors.bg_visual = "#373a45"
		colors.comment = "#4f546b"
	end,


})

theme.load()

