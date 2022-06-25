

print("moin")


-- local event = { 'InsertEnter', 'CmdlineEnter' }
--
-- vim.api.nvim_create_autocmd(event, {
-- 	callback = function()
-- 		vim.cmd([[
-- 			PackerLoad nvim-lspconfig
-- 			PackerLoad nvim-cmp
-- 			PackerLoad lspkind.nvim
-- 			PackerLoad cmp-nvim-lsp
-- 		]])
-- 		print("fdsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
-- 		require 'lang.choice'
-- 		require 'lang.comp'
-- 		require 'lang.snippet'
-- 		end
-- })

require 'lang.choice'
