-- local status = pcall(require, 'packer')
-- if not status then
--     print('packer Error')
--     return
-- end



vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	use {
		'wbthomason/packer.nvim'
	}


	--use 'vim-airline/vim-airline'

	use {
		'morhetz/gruvbox'
	}


	use {
		'joshdick/onedark.vim'
		--cmd = {'colorscheme onedark'}
	}


	use {
		'jiangmiao/auto-pairs'
		-- event = 'InsertEnter'
	}


	use {
		'preservim/nerdtree',
		cmd = {'NERDTreeToggle'}
	}


	use {
		'norcalli/nvim-colorizer.lua',
		ft = {'css'},
		config = function()require 'colorizer'.setup() end
	}


	-- use 'vim-airline/vim-airline-themes'


	use {
		'nvim-treesitter/nvim-treesitter',
		run = 'TSUpdate'
	}


	use {
		'neovim/nvim-lspconfig'
	}


	use {
		'williamboman/nvim-lsp-installer',
		cmd = {'LspInstall', 'LspInstallInfo'},
		config = function()require 'lsp-installer'end
	}


	use {
		'glepnir/dashboard-nvim'
	}


	--use 'junegunn/fzf'
	--use 'junegunn/fzf.vim'


	use {
		'xiyaowong/nvim-transparent'
	}


	use {
		'p00f/nvim-ts-rainbow'
	}


	use {
		'hrsh7th/nvim-cmp',
		-- event = 'InsertEnter'
	}


	use {
		'hrsh7th/cmp-nvim-lsp'
	}


	use {
		'sainnhe/everforest'
		--cmd = {'colorscheme everforest'}
	}


	use {
		'L3MON4D3/LuaSnip'
	}


	use {
		'saadparwaiz1/cmp_luasnip'
	}


	use {
		'hrsh7th/cmp-buffer'
	}


	use {
		'hrsh7th/cmp-path'
	}


	use {
		'hrsh7th/cmp-cmdline'
	}


	--use 'declancm/cinnamon.nvim'


	use {
		'numToStr/Comment.nvim',

	}


	use {
		'nvim-treesitter/playground',
		cmd = {'TSPlaygroundToggle'}
	}


	use {
		'nvim-lua/plenary.nvim'
	}


	use {
		'kyazdani42/nvim-web-devicons'
	}


	use {
		'nvim-telescope/telescope.nvim'
	}


	use {
  		'nvim-lualine/lualine.nvim'
	}

end)
