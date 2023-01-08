local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local servers = {
	"clangd"
}
local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = on_attach,
	}, _config or {})
end

-- Mason.nvim config
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
require("mason-lspconfig").setup_handlers({
	function(server_name)
		nvim_lsp[server_name].setup(config())
	end
})



-- Disable inline lsp and put it into a box
vim.diagnostic.config({
	virtual_text = false
})
vim.o.updatetime = 100
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local border = {
      {"┌", "FloatBorder"},
      {"─", "FloatBorder"},
      {"┐", "FloatBorder"},
      {"│", "FloatBorder"},
      {"┘", "FloatBorder"},
      {"─", "FloatBorder"},
      {"└", "FloatBorder"},
      {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

