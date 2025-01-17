return {
	"echasnovski/mini.indentscope",
	config = function()
		require('mini.indentscope').setup({
			draw = {
				animation = function()
					return 0
				end
			}
		})
	end
}
