vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


require('ufo').setup({
	open_fold_hl_timeout =  150,
	})

vim.cmd.highlight("UfoFoldedFg guifg=#297508")
vim.cmd.highlight("UfoFoldedBg guifg=#6f0e8f")
