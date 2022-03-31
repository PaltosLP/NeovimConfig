set number
set shiftwidth=4
set tabstop=4
syntax enable
set scrolloff=8
set backspace=indent,eol,start 


"plugins
exec 'source'  '/home/paltos/.config/nvim/vim_set/plug.vim'


"mappings
let mapleader = " "
inoremap jj <ESC>
nnoremap <C-n> :NERDTree<Cr>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-a> :call run_file#Run_File()<Cr>
nnoremap <C-s> :w<Cr>


"colors
if (has("termguicolors"))
	set termguicolors
endif
lua require 'colorizer'.setup()
let g:everforest_background = 'hard'
colorscheme everforest
let g:everforest_better_performance = 1


"Nerdtree
let NERDTreeQuitOnOpen=1

"Airline
let g:airline_theme = 'everforest'
"let g:airline#extensions#tabline#enabled = 1

"treesitter requirements, modules
lua require "tree-sitter"

"lsp
lua require 'lsp'
set completeopt=menu,menuone,noselect

"dashboard
let g:dashboard_default_executive ='fzf' 
exec 'source'  '/home/paltos/.config/nvim/vim_set/dashboard.vim'

"transparent
lua require 'transparent'
let g:transparent_enabled = v:true


"π=3.14
":)
