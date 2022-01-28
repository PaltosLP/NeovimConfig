set number
set shiftwidth=4
set tabstop=4
syntax enable
set scrolloff=6
set backspace=indent,eol,start


call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/context.vim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"mappings
inoremap jj <ESC>
nnoremap <C-n> :NERDTree<Cr>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

colorscheme gruvbox
let g:airline_theme='gruvbox'

if (has("termguicolors"))
	set termguicolors
endif

lua require 'colorizer'.setup()

