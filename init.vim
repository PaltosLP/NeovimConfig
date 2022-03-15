set number
set shiftwidth=4
set tabstop=4
syntax enable
set scrolloff=6
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

call plug#end()

"mappings
inoremap jj <ESC>
nnoremap <C-n> :NERDTree<Cr>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-a> :execute Run_File()<Cr>
nnoremap <C-a> :call run_file#Run_File()<Cr>


colorscheme gruvbox
let g:airline_theme='gruvbox'

if (has("termguicolors"))
	set termguicolors
endif

lua require 'colorizer'.setup()

"call run_file#Run_File()

"treesitter requirements, modules
lua require "tree-sitter"

"lsp
lua require "lsp"


":)
