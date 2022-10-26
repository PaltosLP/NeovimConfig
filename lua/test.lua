--wer


local function Open_w()
	-- vim.api.nvim_open_win({buffer}, {enter}, {*config})	
	vim.api.nvim_open_win(0, false,{relative='win', row=3, col=3, width=12, height=3})
end
-- Open_w()

vim.keymap.set('n', '<leader>h',function() vim.api.nvim_open_win(0, false,{relative='win', row=3, col=3, width=12, height=3, border='rounded'}) end, {})
