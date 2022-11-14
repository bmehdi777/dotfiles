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
