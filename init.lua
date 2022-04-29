--
--π=3.14

vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.syntax = 'enable'
vim.opt.scrolloff = 8
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = 'menu,menuone,noselect'
-- vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.o.sidescrolloff = 5
vim.cmd('filetype plugin indent on')

--impatient
require('impatient').enable_profile()

--colorscheme
vim.cmd('colorscheme gruvbox')

--mappings
require 'mappings'

--packer
require 'plugins'

--lsp
require 'lsp'

-- ¯\_(ツ)_/¯

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
