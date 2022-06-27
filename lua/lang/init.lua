

print("moin")


local event = { 'InsertEnter', 'CmdlineEnter' }

vim.api.nvim_create_autocmd(event, {
	callback = function()
		-- vim.cmd([[
		-- 	" PackerLoad lspkind.nvim
		-- 	" PackerLoad nvim-lspconfig
		-- 	PackerLoad luasnip
		-- 	PackerLoad nvim-cmp
		-- 	PackerLoad cmp-nvim-lsp
		-- ]])
		-- print("fdsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
		require 'lang.choice'
		require 'lang.comp'
		require 'lang.langs.snips'
		require 'lang.snippet'
		end
})

require 'lang.choice'



