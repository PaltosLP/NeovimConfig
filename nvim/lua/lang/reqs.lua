
require 'lang.completion.comp'
require 'lang.completion.snippet'

local ft = vim.fn.expand('%:e')

local possibles = { 'py', 'lua', 'vim', 'c', 'cpp', 'html', 'css', 'js' ,'go' }


local state = false


for _, value in pairs(possibles) do
	if value == ft then
		state = true
	end
end

if state then
	local ft_extended = 'lang.langs.' .. ft
	require(ft_extended)
end 
