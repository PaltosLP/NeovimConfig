vim.api.nvim_create_autocmd('VimEnter',{
	command = 'set  formatoptions-=r formatoptions-=o' --  pumblend=15
})
-- vim.opt.formatoptions = vim.opt.formatoptions
--     + "r" -- continue comments after return
--     + "c" -- wrap comments using textwidth
--     + "q" -- allow to format comments w/ gq
--     + "j" -- remove comment leader when joining lines when possible
--     - "t" -- don't autoformat
--     - "a" -- no autoformatting
--     - "o" -- don't continue comments after o/O
--     - "2" -- don't use indent of second line for rest of paragraph

-- set pumblend=15
-- hi PmenuSel blend=0



local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end



-- To get rid of the default colorschemes
vim.cmd 'set wildignore+=blue.vim,darkblue.vim,default.vim,delek.vim,desert.vim,elflord.vim,evening.vim,industry.vim,koehler.vim,morning.vim,murphy.vim,pablo.vim,peachpuff.vim,ron.vim,shine.vim,slate.vim,torte.vim,zellner.vim'

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
vim.opt.cmdheight = 0
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.o.timeoutlen = 200


vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.statuscolumn = "%=%l%s%C"


-- if vim.g.user_interface then
-- 	vim.opt.cmdheight = 0
-- end


vim.cmd([[ 
set clipboard+=unnamedplus
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
]]) --> needs win32yank-wsl.exe in path



-- To make the Boxes nicer
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {	border = "rounded" })
vim.diagnostic.config({ virtual_text = { prefix = "◉" }, float = { border = "rounded" } })


