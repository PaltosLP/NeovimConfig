vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.syntax = 'enable'
vim.opt.scrolloff = 8
--vim.opt.backspace = indent,eol,start
vim.opt.smartindent = true


--mappings
require 'mappings'

--colors
colorscheme = 'gruvbox'

--treesitter
require 'tree-sitter'

--lsp
require 'lsp'

--dashboard
require 'dashboard'

--transparent
require 'transparency'
vim.g.transparent_enabled = true

--comments
require('Comment').setup()

--icons
require 'devicons'

--packer
require 'plugins'
