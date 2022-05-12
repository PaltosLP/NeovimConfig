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

--colorscheme
	use { 'morhetz/gruvbox'	}
	-- use { 'joshdick/onedark.vim' }
	-- use { 'shaunsingh/nord.nvim' }
	-- use { 'NLKNguyen/papercolor-theme' }
	-- use {
	-- 	'ghifarit53/tokyonight-vim',
	-- 	config = function()
	-- 		vim.cmd 'let g:tokyonight_style = "night"'  --available: night, storm
	-- 		vim.cmd 'let g:tokyonight_enable_italic = 1'
	-- 	end
	-- }
	-- use {
	-- 	'sainnhe/everforest',
	-- 	--cmd = {'colorscheme everforest'},
	-- 	config = function ()
	-- 		vim.o.background = 'dark'
	-- 		vim.cmd('let g:everforest_background = "hard"')
	-- 		vim.cmd('let g:everforest_better_performance = 1')
	-- 	end
	-- }

	--use 'vim-airline/vim-airline'




	use {
		'jiangmiao/auto-pairs',
	-- 	-- event = 'InsertEnter',
	-- 	after = { 'nvim-cmp' }
	}

	-- use { 'nvim-autopairs' }




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
		-- ft = { '' },
		config = function()
			require 'dashboard'
		end
	}


	--use 'junegunn/fzf'
	--use 'junegunn/fzf.vim'


	use {
		'xiyaowong/nvim-transparent',
  		config = function()
			require 'transparency'
		end
	 }


	use {
		'p00f/nvim-ts-rainbow',
		-- after = { 'nvim-lspconfig' }
	}


	use {
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		keys = { 'n', ':' },
		-- config = function()
		-- 	require 'lsp'
		-- end
		-- after = { 'nvim-lspconfig' },
		--require 'lsp'
	}


	use {
		'hrsh7th/cmp-nvim-lsp',
		module = 'cmp_nvim_lsp',
		-- after = { 'nvim-cmp' }
	}



	use {
		'L3MON4D3/LuaSnip',
		event = 'InsertEnter',
	}


	use {
		'saadparwaiz1/cmp_luasnip',
		event = 'InsertEnter',
		-- after = { 'nvim-cmp', 'LuaSnip' }
	}


	use {
		'hrsh7th/cmp-buffer',
		event = 'InsertEnter',
		-- after = { 'nvim-cmp' }
	}


	use {
		'hrsh7th/cmp-path',
		event = 'InsertEnter',
		-- after = { 'nvim-cmp' }
	}


	use {
		'hrsh7th/cmp-cmdline',
		event = 'InsertEnter',
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
		'nvim-lua/plenary.nvim',
		module = 'plenary'
	}


	use {
		'kyazdani42/nvim-web-devicons',
		module = 'nvim-web-devicons',
		config = function ()
			require 'devicons'
		end
	}


	use {
		'nvim-telescope/telescope.nvim',
		-- module = 'telescope',
		-- keys = {
		-- 	{ 'n', '<leader>f' },
		-- 	-- { 'n', '<leader>fg' },
		-- }
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
		tag = "latest",
		ft = 'norg',
		after = {'nvim-treesitter','telescope.nvim'},
		config = function()
			require 'neo_org'
		end,
	}


	use {
		'mg979/vim-visual-multi',
		keys = {
			{'n','<C-n>'}
		}
		-- event = 'VisualEnter'
	}



	use {
		'onsails/lspkind.nvim',
		-- event = 'InsertEnter',
		-- after = { 'nvim-cmp' }
	}


	use {
		'ggandor/lightspeed.nvim',
		keys = {
			{'n','s'}
		}
		-- event = 'SelectEnter'
	}


	use {
		'dstein64/vim-startuptime',
		cmd = { 'StartupTime' },
	}


	use {
		'folke/which-key.nvim',
		cmd = { 'WhichKey' },

	}
end)
