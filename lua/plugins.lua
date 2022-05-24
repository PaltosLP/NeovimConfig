-- local status = pcall(require, 'packer')
-- if not status then
--     print('packer Error')
--     return
-- end

-- local packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end
--   }
-- }



vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
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
	use {
		'rmehri01/onenord.nvim'
	}


	--use 'vim-airline/vim-airline'




	-- use {
		-- 'jiangmiao/auto-pairs',
	-- 	-- event = 'InsertEnter',
	-- 	after = { 'nvim-cmp' }
	-- }

	use {
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require 'auto-pairs'
		end
	}


	use {
		'windwp/nvim-ts-autotag',
		-- after = { 'nvim-treesitter' },
		ft = { 'html' },
	}




	-- use {
	-- 	'preservim/nerdtree',
	-- 	cmd = {'NERDTreeToggle'},
	-- 	config = function ()
	-- 		vim.cmd('let NERDTreeQuitOnOpen=1')
	-- 	end
	-- }


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
		-- event = { "BufRead", "BufWinEnter" },
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
		-- ft = { 'dashboard' },
		-- cmd = {
		-- 	"Dashboard",
		-- 	"DashboardNewFile",
		-- 	"DashboardJumpMarks",
		-- 	"SessionLoad",
		-- 	"SessionSave",
		-- },
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
		event = { 'InsertEnter', 'CmdlineEnter' },
		-- keys = { 'n', ':' },
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
		"rafamadriz/friendly-snippets",
		event = 'InsertEnter',
		-- after = 'LuaSnip',
		config = function()
			require("luasnip/loaders/from_vscode").load({
				paths = {"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets"},})
		end

	}


	use {
		'saadparwaiz1/cmp_luasnip',
		event = { 'InsertEnter', 'CmdlineEnter' },
		-- after = { 'nvim-cmp', 'LuaSnip' }
	}


	use {
		'hrsh7th/cmp-buffer',
		event = { 'InsertEnter', 'CmdlineEnter' },
		-- after = { 'nvim-cmp' }
	}


	use {
		'hrsh7th/cmp-path',
		event = { 'InsertEnter', 'CmdlineEnter' },
		-- after = { 'nvim-cmp' }
	}


	use {
		'hrsh7th/cmp-cmdline',
		event = { 'InsertEnter', 'CmdlineEnter' },
		-- after = { 'nvim-cmp' }
	}


	--use 'declancm/cinnamon.nvim'


	use {
		'numToStr/Comment.nvim',
		keys = {
			{ 'n', 'g' },
			{ 'v', 'g' },
		},
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
		-- { 'n', '<leader>fg' },
		-- },
		--cmd = {'Telescope find_files'}
	}


	use {
  		'nvim-lualine/lualine.nvim',
		after = "gruvbox",
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
		-- module = 'lspkind',
		-- event = { 'BufRead', 'InsertEnter' },
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
		-- cmd = { 'WhichKey' },
		config = function()
			require 'whichkey'
		end

	}


	use {
		'kyazdani42/nvim-tree.lua',
		cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
		config = function()
			require 'nvim_tree'
		end
	}


	use {
		'folke/zen-mode.nvim',
		cmd = { 'ZenMode' },
		config = function()
			require 'zenmode'
		end
	}

	use {
		'folke/twilight.nvim',
		cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
		config = function()
			require 'twilights'
		end
	}

	use {
        "max397574/better-escape.nvim",
		event = { 'InsertEnter' },
        config = function()
            require 'betterescape'
  		end,
	}


	use {
		'folke/trouble.nvim',
		cmd = { 'Trouble', 'TroubleToggle' },
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require 'troubles'
		end,
	}
	-- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	-- use {
	-- 	'karb94/neoscroll.nvim',
	-- 	config = function()
	-- 		require('neoscroll').setup()
	-- 	end
	-- }


end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  		}
	}
})


