-- local utils = require 'lang.langs.utils'


-- utils.capabilities.textDocument.completion.completionItem.snippetSupport = true



-- require 'lspconfig'.tsserver.setup {
	-- on_attach = utils.on_attach,
	-- capabilities = utils.capabilities
-- }

require 'lspconfig'.quick_lint_js.setup {

}
