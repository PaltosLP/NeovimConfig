

require 'lsp.comp'

local ft = vim.fn.expand('%:e')

-- if ft == 'dashboard' then
-- 	return 0
-- elseif ft == 'netrw' then
-- 	return 0
--
-- else
-- 	ft = ft .. 'lsp'
-- 	-- print('filetype =', ft)
--
-- 	local ft_extended = 'lsp.' .. ft
-- 	-- print('blub', ft2) --prints: lsp.pylsp
--
-- 	require(ft_extended)
-- end

print('ft =', ft)

ft = ft .. 'lsp'
-- print('filetype =', ft)

local ft_extended = 'lsp.' .. ft
-- print('blub', ft2) --prints: lsp.pylsp

require(ft_extended)
