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
vim.opt.termguicolors = true


--colorscheme
vim.o.background = 'dark'
vim.cmd('let g:everforest_background = "hard"')
vim.cmd('colorscheme gruvbox')
vim.cmd('let g:everforest_better_performance = 1')

--mappings
require 'mappings'


--packer
require 'plugins'


--lsp
require 'lsp'


--treesitter
require 'tree-sitter'


--dashboard
require 'dashboard'


--transparent
--require 'transparency'
vim.g.transparent_enabled = true


--icons
require 'devicons'


--lualine
require 'lua-line'


--comments
require('Comment').setup()


--NERDTree
vim.cmd('let NERDTreeQuitOnOpen=1')
