

vim.opt.cindent = true



require('lspconfig')['clangd'].setup {
	-- on_attach = utils.on_attach,
	-- capabilities = utils.capabilities
}

