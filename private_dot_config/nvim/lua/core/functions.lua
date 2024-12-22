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
			vim.cmd("%! rustfmt")
		end,
		["typescript"] = jsTsFormat,
		["typescriptreact"] = jsTsFormat,
		["javascript"] = jsTsFormat,
		["javascriptreact"] = jsTsFormat,
		["go"] = function()
			local curPos = vim.api.nvim_win_get_cursor(0)
			vim.cmd("silent !go fmt %")
		end
	}
	local func = fmt_table[vim.bo.filetype]
	if (func) then
		func()
	end
end

function M.openInNewTab(cmd)
	vim.cmd(":tabnew")
	vim.cmd(cmd)
end

return M
