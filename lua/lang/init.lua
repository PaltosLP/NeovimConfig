--vim.api.nvim_create_autocmd("BufEnter", {
--				callback = function()
--					vim.defer_fn(function()
--						vim.cmd([[
--						PackerLoad nvim-cmp
--						PackerLoad LuaSnip
--						PackerLoad lspkind.nvim
--						"PackerLoad cmp_nvim_lsp
--						]])
--						require 'ft.reqs'
--					end, 50)
--				end,
--			})

require 'lang.reqs'

