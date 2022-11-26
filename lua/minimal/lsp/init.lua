
local packer = require('packer')

local opt = true
local event = { 'InsertEnter', 'CmdlineEnter' }

packer.use({ 'neovim/nvim-lspconfig' })
packer.use({ 'hrsh7th/nvim-cmp', opt = opt, event = event }) --, event = event
packer.use({ 'hrsh7th/cmp-nvim-lsp' }) --, event = event
packer.use({ 'hrsh7th/cmp-buffer', opt = opt, event = event }) --, event = event
packer.use({ 'hrsh7th/cmp-path', opt = opt, event = event })  --, event = event
packer.use({ 'hrsh7th/cmp-cmdline', opt = opt, event = {'CmdlineEnter'} }) --, event = event
packer.use({ 'L3MON4D3/LuaSnip', opt = opt, event = event }) --, event = event
packer.use({ 'saadparwaiz1/cmp_luasnip', opt = opt, event = event }) --, event = event

packer.use({ 'onsails/lspkind.nvim' }) --, event = event


packer.use({ 'williamboman/nvim-lsp-installer', cmd = {'LspInstall', 'LspInstallInfo'}, config = function() require 'lsp.lsp-installer' end })

packer.use({ 'windwp/nvim-ts-autotag',	ft = { 'html' }	})

packer.use({ "rafamadriz/friendly-snippets", event = "InsertCharPre", config = function() require("luasnip/loaders/from_vscode").load({
	paths = {
		"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
		},
	})
	end }) --, opt = true




--local event = { 'InsertEnter', 'CmdlineEnter' }

-- vim.api.nvim_create_autocmd(event, {
-- 	callback = function()
-- 		-- vim.cmd([[
-- 		-- 	" PackerLoad lspkind.nvim
-- 		-- 	" PackerLoad nvim-lspconfig
-- 		-- 	PackerLoad luasnip
-- 		-- 	PackerLoad nvim-cmp
-- 		-- 	PackerLoad cmp-nvim-lsp
-- 		-- ]])
-- 		require 'lang.comp'
-- 		require 'lang.langs.snips'
-- 		require 'lang.snippet'
-- 		end
-- })


--require "core.lsp.comp"

vim.api.nvim_create_autocmd(event, {
	callback = function()
		vim.defer_fn(function()
			require 'core.lsp.comp'
			require 'core.lsp.langs.snips'
			require 'core.lsp.snippet'
			end, 100)
	end
})






-- vim.wo.foldcolumn = '1'
-- vim.wo.foldlevel = 99 -- feel free to decrease the value
-- vim.wo.foldenable = true

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
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
		on_attach_path = 'core.lsp.langs.' .. ft
		state = false
	end
end


if state then
	on_attach_path = 'core.lsp.langs.none'
end


local config = { capabilities = capabilities, on_attach = require(on_attach_path), settings = {
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


for _,server in pairs(servers) do
	language_servers[server] = config
end


for ls,conf in pairs(language_servers) do
    require('lspconfig')[ls].setup(conf)
end


-- require('ufo').setup()

