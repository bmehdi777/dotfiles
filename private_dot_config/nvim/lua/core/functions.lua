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
	local _, choice = pcall(vim.fn.confirm, "Organize imports ?", "Yes\nNo", 1)
	if choice == 1 then
		vim.cmd("OrganizeImports")
	end
end

function M.format()
	local fmt_table = {
		["rust"] = function()
			vim.cmd("%! rustfmt")
		end,
		["typescript"] = jsTsFormat,
		["javascript"] = jsTsFormat
	}
	local func = fmt_table[vim.bo.filetype]
	if (func) then
		func()
	end
end

return M
