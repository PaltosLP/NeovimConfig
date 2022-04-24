

require 'lsp.comp'

local ft = vim.fn.expand('%:e')
ft = ft .. 'lsp'
-- print('filetype =', ft)

local ft_extended = 'lsp.' .. ft
-- print('blub', ft2) --prints: lsp.pylsp

require(ft_extended)
