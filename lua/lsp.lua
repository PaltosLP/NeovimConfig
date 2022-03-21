local status = pcall(require, 'lspconfig')
if not status then
	print('lsp Error')
	return
end

require 'lspconfig'.pyright.setup{}
require 'lspconfig'.vimls.setup{}
require 'lspconfig'.sumneko_lua.setup{}
