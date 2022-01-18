set number
set shiftwidth=4
set tabstop=4
syntax enable
set scrolloff=6
set backspace=indent,eol,start


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

inoremap jk <ESC>

colorscheme gruvbox
let g:airline_theme='gruvbox'

if (has("termguicolors"))
	set termguicolors
endif

lua require 'colorizer'.setup()

