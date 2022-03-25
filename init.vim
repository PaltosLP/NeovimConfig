set number
set shiftwidth=4
set tabstop=4
syntax enable
set scrolloff=8
set backspace=indent,eol,start 
    

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'xiyaowong/nvim-transparent'
Plug 'p00f/nvim-ts-rainbow'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'sainnhe/everforest'

call plug#end()

"mappings
let mapleader = " "
inoremap jj <ESC>
nnoremap <C-n> :NERDTree<Cr>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-a> :call run_file#Run_File()<Cr>

"colors
colorscheme everforest
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
if (has("termguicolors"))
	set termguicolors
endif
lua require 'colorizer'.setup()


"Nerdtree
let NERDTreeQuitOnOpen=1

"Airline
let g:airline_theme = 'everforest'
"let g:airline#extensions#tabline#enabled = 1

"treesitter requirements, modules
lua require "tree-sitter"

"lsp
lua require "lsp"

"dashboard
let g:dashboard_default_executive ='fzf' 
exec 'source'  '/home/paltos/.config/nvim/vim_set/dashboard.vim'

"transparent
lua require 'transparent'
let g:transparent_enabled = v:true

"nvim cmp
set completeopt=menu,menuone,noselect
lua require 'completion'

"inoremap <silent> <expr> <Tab>
"    \ pumvisible() ? "\<C-n>" :
"    \ v:lua.check_back_space() ? "\<Tab>" :
"    \ completion#trigger_completion()


":)
