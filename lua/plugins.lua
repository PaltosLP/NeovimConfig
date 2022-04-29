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
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	use {
		'wbthomason/packer.nvim',
	}


	use {
		'lewis6991/impatient.nvim'
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
		cmd = {'NERDTreeToggle'},
		config = function ()
			vim.cmd('let NERDTreeQuitOnOpen=1')
		end
	}


	use {
		'norcalli/nvim-colorizer.lua',
		ft = {'css'},
		config = function()
			require 'colorizer'.setup()
		end
	}


	-- use 'vim-airline/vim-airline-themes'


	use {
		'nvim-treesitter/nvim-treesitter',
		run = 'TSUpdate',
		config = function()
			require 'tree-sitter'
		end
	}


	use {
		'neovim/nvim-lspconfig'
	}


	use {
		'williamboman/nvim-lsp-installer',
		cmd = {'LspInstall', 'LspInstallInfo'},
		config = function()
			require 'lsp-installer'
		end
	}


	use {
		'glepnir/dashboard-nvim',
		config = function()
			require 'dashboard'
		end
	}


	--use 'junegunn/fzf'
	--use 'junegunn/fzf.vim'


	use {
		'xiyaowong/nvim-transparent',
  		config = { 'vim.g.transparent_enabled = true' }
	 }


	use {
		'p00f/nvim-ts-rainbow',
		-- after = { 'nvim-lspconfig' }
	}


	use {
		'hrsh7th/nvim-cmp',
		-- event = 'InsertEnter',
		-- after = { 'nvim-lspconfig' },
		--require 'lsp'
	}


	use {
		'hrsh7th/cmp-nvim-lsp',
		-- after = { 'nvim-cmp' }
	}


	use {
		'sainnhe/everforest',
		--cmd = {'colorscheme everforest'},
		config = function ()
			vim.o.background = 'dark'
			vim.cmd('let g:everforest_background = "hard"')
			vim.cmd('let g:everforest_better_performance = 1')
		end
	}


	use {
		'L3MON4D3/LuaSnip'
	}


	use {
		'saadparwaiz1/cmp_luasnip',
		-- after = { 'nvim-cmp', 'LuaSnip' }
	}


	use {
		'hrsh7th/cmp-buffer',
		-- after = { 'nvim-cmp' }
	}


	use {
		'hrsh7th/cmp-path',
		-- after = { 'nvim-cmp' }
	}


	use {
		'hrsh7th/cmp-cmdline',
		-- after = { 'nvim-cmp' }
	}


	--use 'declancm/cinnamon.nvim'


	use {
		'numToStr/Comment.nvim',
		config = function ()
			require 'Comment'.setup()
		end
	}


	use {
		'nvim-treesitter/playground',
		cmd = {'TSPlaygroundToggle'}
	}


	use {
		'nvim-lua/plenary.nvim'
	}


	use {
		'kyazdani42/nvim-web-devicons',
		config = function ()
			require 'devicons'
		end
	}


	use {
		'nvim-telescope/telescope.nvim'
		--cmd = {'Telescope find_files'}
	}


	use {
  		'nvim-lualine/lualine.nvim',
		config = function ()
			require 'lua-line'
		end
	}
	-- use {
	-- 	'henriquehbr/nvim-startup.lua',
	-- 	config = function ()
	-- 		require 'nvim-startup'.setup()
	-- 	end
	-- }

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			require 'indent'
		end
	}


	use {
		'nvim-neorg/neorg',
		ft = 'norg',
		after = {'nvim-treesitter','telescope.nvim'},
		config = function()
			require 'neo_org'
		end,
	}


	use {
		'mg979/vim-visual-multi'
	}


	use {
		'shaunsingh/nord.nvim'
	}


	use {
		'onsails/lspkind.nvim',
		-- after = { 'nvim-cmp' }
	}

end)
