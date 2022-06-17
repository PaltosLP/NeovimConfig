-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.syntax = 'enable'
vim.opt.scrolloff = 8
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = 'menu,menuone,noselect'
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.o.sidescrolloff = 5
vim.cmd 'filetype plugin indent on'
vim.opt.backup = false
-- vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.o.timeoutlen = 600

vim.opt.foldmethod = "expr" -- use treesitter for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"



-- To make the Boxes nicer
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {	border = "rounded" })
vim.diagnostic.config({ virtual_text = { prefix = "◉" }, float = { border = "rounded" } })

-- To get rid of the default colorschemes
vim.cmd 'set wildignore+=blue.vim,darkblue.vim,default.vim,delek.vim,desert.vim,elflord.vim,evening.vim,industry.vim,koehler.vim,morning.vim,murphy.vim,pablo.vim,peachpuff.vim,ron.vim,shine.vim,slate.vim,torte.vim,zellner.vim'

-- set pumblend=15
-- hi PmenuSel blend=0
