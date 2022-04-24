

require 'lsp.comp'

local ft = vim.fn.expand('%:e')
ft = ft .. 'lsp'
print('filetype =', ft)


require(ft)
