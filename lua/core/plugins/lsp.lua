local servers = { 'lua_ls', 'clangd', 'gopls', 'quick_lint_js', 'pyright', 'vimls', 'html' } --, 'css'
local language_servers = {}


local ft = vim.fn.expand('%:e')
if ft == '' then
	ft = 'none'
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
	semanticTokensProvider = nil
}


local on_attach = function(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil
end

local config = { capabilities = capabilities, on_attach = on_attach, settings = { --on attach path changed on tests branch
	Lua = {
		diagnostics = {
			globals = { 'vim' }
		}
	},
	-- python = {
	-- 	single_file_support = true,
	-- }
}
}

require('lspconfig.ui.windows').default_options.border = 'single'
vim.cmd[[hi LspInfoBorder guifg=white ]]

for _,server in pairs(servers) do
	language_servers[server] = config
end


for ls,conf in pairs(language_servers) do
    require('lspconfig')[ls].setup(conf)
end
