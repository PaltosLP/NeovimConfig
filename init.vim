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
nnoremap <C-a> :execute Run_File()<Cr>


colorscheme gruvbox
let g:airline_theme='gruvbox'

if (has("termguicolors"))
	set termguicolors
endif

lua require 'colorizer'.setup()

function Run_File()
	let filetype = expand('%:e')
	let file_name = expand('%:t:r')
	let full_file_name = file_name .".". filetype
	"let c_command3 = "!clear"
	if filetype == "py"
		execute "!python3 " . full_file_name
	elseif filetype == "vim"
		echo "vim"
	elseif filetype == "lua"
		echo "lua"
	elseif filetype == "c"
		execute "!gcc " . full_file_name . " -o " . "executable_c" 
		execute "!./executable_c"
		execute "!rm executable_c"
	elseif filetype == "cpp"
		execute "!g++ " . full_file_name . " -o" . "executable_cpp"
		execute "!./executable_cpp"
		execute "!rm executable_cpp"
	endif	
endfunction

"treesitter requirements, modules
lua require "tree-sitter"

"lsp
lua require "lsp"


":)
