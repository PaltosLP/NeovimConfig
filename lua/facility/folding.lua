
-- require 'ufo'.setup()

vim.opt.foldmethod = "expr" -- use treesitter for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local event = { 'BufReadPost', 'FileReadPost' }

------> for ufo gotta fix
-- vim.api.nvim_create_autocmd(event, {
-- 	callback = function()
-- 		vim.defer_fn(function()
-- 				vim.cmd([[
-- 				normal zR
-- 				]])
-- 			end, 0)
-- 		end
-- })

vim.api.nvim_create_autocmd(event, {
	callback = function()
			vim.cmd([[
			normal zR
			]])
		end
})


