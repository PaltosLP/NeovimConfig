require 'highlights.tree-sitter'
require 'highlights.colorscheme'
-- require 'highlights.transparency'
require 'highlights.dent'


-- Float transparency and Line Number Highlights
vim.cmd[[highlight NormalFloat  guibg=none]]
vim.cmd[[highlight FloatBorder  guibg=none]]
vim.cmd[[highlight LineNr guifg=grey]]
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "@function.call" })


-- Highlight the @foo.bar capture group with the "Identifier" highlight group
vim.api.nvim_set_hl(0, "@variable", { link = "rainbowcol4" })
vim.api.nvim_set_hl(0, "@field", { link = "SpecialKey" })
vim.api.nvim_set_hl(0, "@keyword.function", { link = "keyword" })



