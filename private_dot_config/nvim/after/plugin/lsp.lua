local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local servers = {
	"clangd",
	"rust_analyzer"
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



vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
	end,
})
