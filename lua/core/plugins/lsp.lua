local servers = { 'sumneko_lua', 'clangd', 'gopls', 'quick_lint_js', 'pyright', 'vimls' }
local possibles = { 'py', 'lua', 'vim', 'c', 'cpp', 'html', 'css', 'js' ,'go' }
local language_servers = {}
local on_attach_path
local state = true



local ft = vim.fn.expand('%:e')
if ft == '' then
	ft = 'none'
end


for _, val in pairs(possibles) do
	if val == ft then
		on_attach_path = 'lang.langs.' .. ft
		state = false
	end
end


if state then
	on_attach_path = 'lang.langs.none'
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
	semanticTokensProvider = nil
}
-- client.server_capabilities.semanticTokensProvider = nil

-- vim.api.nvim_create_aucmd("LspAttach", {
--     callback = function(args)
--         local bufnr = args.buf
--         -- vim.lsp.semantic_tokens.stop(bufnr, args.data.client_id)
--         local client=vim.lsp.get_client_by_id(args.data.client_id)
--         client.server_capabilities.semanticTokensProvider = nil
--     end,
-- })

local config = { capabilities = capabilities, on_attach = require('core.plugins.utils_lsp').on_attach, settings = { --on attach path changed on tests branch
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


-- require('ufo').setup()
