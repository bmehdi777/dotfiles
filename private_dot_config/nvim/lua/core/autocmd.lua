--vim.api.nvim_create_autocmd('LspAttach', {
--	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--	callback = function(ev)
--		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--		local opts = { buffer = ev.buf }
--		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--	end,
--})

vim.api.nvim_create_user_command('Browse', 
	function(opts)
		vim.fn.system { 'xdg-open', opts.fargs[1]}
	end,
	{ nargs = 1 }
)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set('n', '<C-n>', '<cmd>cn | wincmd p<CR>', opts)
    vim.keymap.set('n', '<C-p>', '<cmd>cN | wincmd p<CR>', opts)
  end,
})
