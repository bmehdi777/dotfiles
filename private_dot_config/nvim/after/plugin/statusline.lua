local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup {
	options = { 
		theme = "palenight",
		section_separators = '', component_separators = '',
		globalstatus = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'location'},
		lualine_c = {"require'lsp-status'.status()"},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'filename'},
		lualine_z = {'branch', 'diff', 'diagnostics'},
	},
	NvimTree = {
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		}
	}
}
