--To make the lazyloading possible

--for InsertEnter
vim.api.nvim_create_autocmd({'InsertEnter', 'CmdlineEnter'}, {
	callback = function()
			vim.cmd[[PackerLoad nvim-cmp]]
			vim.cmd[[PackerLoad cmp-nvim-lsp]]
			vim.cmd[[PackerLoad cmp-buffer]]
			vim.cmd[[PackerLoad cmp-path]]
			vim.cmd[[PackerLoad LuaSnip]]
			vim.cmd[[PackerLoad cmp_luasnip]]
			vim.cmd[[PackerLoad lspkind.nvim]]
 			vim.cmd[[PackerLoad cmp-cmdline]] --<--
			vim.cmd[[PackerLoad friendly-snippets]]
			require 'completion.comp'
			require 'completion.snips'
		end
})


--for CmdlineEnter
-- vim.api.nvim_create_autocmd({'CmdlineEnter'}, {
-- 	callback = function()
-- 			vim.cmd[[PackerLoad nvim-cmp]]
-- 			vim.cmd[[PackerLoad cmp-cmdline]] --<--
-- 			vim.cmd[[PackerLoad cmp-nvim-lsp]]
-- 			vim.cmd[[PackerLoad cmp-buffer]]
-- 			vim.cmd[[PackerLoad cmp-path]]
-- 			vim.cmd[[PackerLoad lspkind.nvim]]
-- 			require 'completion.comp'
-- 		end
-- })
