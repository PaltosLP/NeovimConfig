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

--capabilities = capabilities,
local config = {  on_attach = require('core.plugins.utils_lsp').on_attach, settings = { --on attach path changed on tests branch
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