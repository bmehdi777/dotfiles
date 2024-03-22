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
			vim.cmd("%! rustfmt")
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
