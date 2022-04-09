"
set number
set shiftwidth=4
set tabstop=4
syntax enable
set scrolloff=8
set backspace=indent,eol,start 
set smartindent
" c --> set cindent

"plugins
exec 'source'  '/home/paltos/.config/nvim/vim/plug.vim'


"mappings
let mapleader = " "
inoremap jj <ESC>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-a> :call run_file#Run_File()<Cr>
nnoremap <C-s> :call save#w()<Cr>
nnoremap <C-r> :call number_set#relative_numb()<Cr>
nnoremap <C-n> :call number_set#normal_numb()<Cr>
nnoremap <leader>ff :Telescope find_files<cr>

lua require 'mappings'


"colors
if (has("termguicolors"))
	set termguicolors
endif
"lua require 'colorizer'.setup()
let g:everforest_background = 'hard'
colorscheme gruvbox
let g:everforest_better_performance = 1


"Nerdtree
let NERDTreeQuitOnOpen=1

"Airline
let g:airline_theme = 'gruvbox'
"let g:airline#extensions#tabline#enabled = 1

"treesitter requirements, modules
lua require "tree-sitter"

"lsp
lua require 'lsp'
set completeopt=menu,menuone,noselect

"dashboard
"let g:dashboard_default_executive ='Telescope' 
"exec 'source'  '/home/paltos/.config/nvim/vim/dashboard.lua'
lua require 'dashboard'

"transparent
lua require 'transparent'
let g:transparent_enabled = v:true

"comments
lua require('Comment').setup()

"icons
lua require 'devicons'

"Packer
lua require 'plugins'


""¯\_(ツ)_/¯
"π=3.14
":)
