

require 'lsp.comp'

local ft = vim.fn.expand('%:e')

-- if ft in ['py', 'lua', 'c'] then
-- blablabla
-- else
-- pass


-- print('ft =', ft)
ft = ft .. 'lsp'
-- print('filetype =', ft)

local ft_extended = 'lsp.settings.' .. ft
-- print('blub', ft2) --prints: lsp.pylsp

require(ft_extended)
