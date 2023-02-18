vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


require('ufo').setup({
	open_fold_hl_timeout =  150,
})

vim.cmd.highlight("UfoFoldedFg guifg=#297508")
vim.cmd.highlight("UfoFoldedBg guifg=#6f0e8f")
-- vim.cmd.highlight("UfoPreviewCursorLine guifg=#6f0e8f")
