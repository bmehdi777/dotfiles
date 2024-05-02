local M = {}

function M.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

function M.format()
	local fmt_table = {
		["rust"] = function()
			local curPos = vim.api.nvim_win_get_cursor(0)
			vim.cmd("%! rustfmt")
			vim.api.nvim_win_set_cursor(0, curPos)
		end
	}
	local func = fmt_table[vim.bo.filetype]
	if (func) then
		func()
	else
		vim.cmd("Prettier")
	end
end

return M
