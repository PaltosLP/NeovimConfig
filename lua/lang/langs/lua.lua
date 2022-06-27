

require('lspconfig')['sumneko_lua'].setup {
	-- on_attach = utils.on_attach,
	-- capabilities = utils.capabilities,
	settings = {
	Lua = {
	   diagnostics = {
		  globals = { 'vim' }
		  }
	   }
	}
}


