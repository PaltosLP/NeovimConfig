-- vim.wo.foldcolumn = '1'
-- vim.wo.foldlevel = 99 -- feel free to decrease the value
-- vim.wo.foldenable = true

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local servers = { 'sumneko_lua', 'clangd', 'gopls', 'quick_lint_js', 'pyright', 'vimls' }
local language_servers = {}

local ft = vim.fn.expand('%:e')
local on_attach_path = 'lang.langs.' .. ft
local config = { capabilities = capabilities, on_attach = require(on_attach_path), settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }


for _,server in pairs(servers) do
	language_servers[server] = config
end



for ls,conf in pairs(language_servers) do
    require('lspconfig')[ls].setup(
	conf
	)
end


-- require('ufo').setup()

