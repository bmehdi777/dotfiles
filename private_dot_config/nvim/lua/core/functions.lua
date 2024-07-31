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

function jsTsFormat()
	vim.cmd("Prettier")
end

function M.format()
	local fmt_table = {
		["rust"] = function()
			local curPos = vim.api.nvim_win_get_cursor(0)
			vim.cmd("%! rustfmt")
			vim.api.nvim_win_set_cursor(0,curPos)
		end,
		["typescript"] = jsTsFormat,
		["javascript"] = jsTsFormat,
		["go"] = function()
			local curPos = vim.api.nvim_win_get_cursor(0)
			vim.cmd("silent !go fmt %")
			vim.api.nvim_win_set_cursor(0,curPos)
		end
	}
	local func = fmt_table[vim.bo.filetype]
	if (func) then
		func()
	else
		local curPos = vim.api.nvim_win_get_cursor(0)
		vim.lsp.buf.format()
		vim.api.nvim_win_set_cursor(0,curPos)
	end
end

function M.openInNewTab(cmd)
	vim.cmd(":tabnew")
	vim.cmd(cmd)
end

return M
