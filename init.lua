--

vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.syntax = 'enable'
vim.opt.scrolloff = 8
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = 'menuone,noselect'
vim.opt.smartindent = true


--colorscheme
vim.o.background = 'dark'
vim.cmd('let g:everforest_background = "hard"')
vim.cmd('colorscheme gruvbox')
vim.cmd('let g:everforest_better_performance = 1')

--mappings
require 'mappings'

--statusline
vim.cmd('let g:airline_theme = "gruvbox"')

--treesitter
require 'tree-sitter'

--lsp
require 'lsp'

--dashboard
require 'dashboard'

--transparent
--require 'transparency'
-- vim.cmd('let g:transparent_enabled = v:true')
vim.g.transparent_enabled = true

--comments
require('Comment').setup()

--icons
require 'devicons'

--packer
require 'plugins'

--NERDTree
vim.cmd('let NERDTreeQuitOnOpen=1')
