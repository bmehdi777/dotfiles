local status, cheatsheet = pcall(require, "cheatsheet")
if not status then
	return
end

cheatsheet.setup({
	bundled_cheatsheets = false,
	bundled_plugin_cheatsheets = false,
	include_only_installed_plugins = false,
}) 
