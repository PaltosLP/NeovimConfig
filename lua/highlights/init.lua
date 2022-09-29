require 'highlights.tree-sitter'
require 'highlights.colorscheme'
-- require 'highlights.transparency'
require 'highlights.indent'



vim.cmd[[highlight NormalFloat ctermbg=0 guibg=none]]
vim.cmd[[highlight FloatBorder ctermbg=0 guibg=none]]
vim.cmd[[highlight LineNr guifg=grey]]

-- vim.cmd 'hi! link TSKeywordOperator Keyword'

-- require("nvim-treesitter.highlight").set_custom_captures({
--     -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--     -- ["foo.bar"] = "Identifier",
--     ["require_call"] = "RequireCall",
--     ["function_definition"] = "FunctionDefinition",
--     ["quantifier"] = "Special",
--     ["field"] = "htmlArg",
-- })
--
--
-- require("nvim-treesitter.highlight").set_custom_captures({
--     -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--     -- ["foo.bar"] = "Identifier",
--     ["require_call"] = "RequireCall",
--     ["function_definition"] = "FunctionDefinition",
--     ["quantifier"] = "Special",
--     ["variable"] = "TSField",
-- })
