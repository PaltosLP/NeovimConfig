-- local utils = require 'lang.langs.utils'


require('lspconfig')['pyright'].setup {
	-- on_attach = utils.on_attach,
	-- capabilities = utils.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { }
				}
  			}
		}
}

