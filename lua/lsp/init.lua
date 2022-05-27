-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


require 'lsp.comp'
require 'lsp.snippet'

local ft = vim.fn.expand('%:e')

local possibles = { 'py', 'lua', 'vim', 'c', 'cpp', 'html', 'css', 'js' ,'go' }


local state = false


for _, value in pairs(possibles) do
	-- local occur = false
	if value == ft then
		state = true
	end
end

if state then
	-- ft = ft .. 'lsp'
	local ft_extended = 'lsp.langs.' .. ft .. 'lsp'
	require(ft_extended)
end
