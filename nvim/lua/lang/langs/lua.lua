

require('lspconfig')['sumneko_lua'].setup{
	--on_attach = utils.on_attach,
	--capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	settings = {
		Lua = {
	   		diagnostics = {
		  		globals = { 'vim' }
		  	}
	   	}
	}
}
