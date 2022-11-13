--wer


-- local function Open_w()
-- 	-- vim.api.nvim_open_win({buffer}, {enter}, {*config})	
-- 	vim.api.nvim_open_win(0, false,{relative='win', row=3, col=3, width=12, height=3})
-- end
-- Open_w()

vim.keymap.set('n', '<leader>h',function() vim.api.nvim_open_win(0, false,{relative='win', row=3, col=3, width=12, height=3, border='rounded'}) end, {})


local packer = require('packer')
-- packer.init({})
-- local use = packer.use
--packer.reset()

packer.use({
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup()
  end,
})


print("HEEEELlllloooo")
