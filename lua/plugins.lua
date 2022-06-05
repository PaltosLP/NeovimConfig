

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
	use { 'wbthomason/packer.nvim' }
	use { 'lewis6991/impatient.nvim' }
	use { 'nathom/filetype.nvim', config = function() require 'file-type' end }

--colorscheme
	use { 'morhetz/gruvbox'	}
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'joshdick/onedark.vim', }
	use { 'marko-cerovac/material.nvim', cmd = { 'colorscheme' } }
	use { 'shaunsingh/nord.nvim', cmd = { 'colorscheme' } }
	use { 'NLKNguyen/papercolor-theme', cmd = { 'colorscheme' } }
	use { 'ghifarit53/tokyonight-vim', cmd = { 'colorscheme' }}
	use { 'sainnhe/everforest', cmd = { 'colorscheme' } }
	use { 'rmehri01/onenord.nvim', cmd = { 'colorscheme' } }


	-- use 'vim-airline/vim-airline'
	-- use 'vim-airline/vim-airline-themes'
	-- use { 'jiangmiao/auto-pairs', event = 'InsertEnter', after = { 'nvim-cmp' } }


	use { 'windwp/nvim-autopairs',
			setup = function()

			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function()
					vim.defer_fn(function()
						vim.cmd([[
						PackerLoad nvim-autopairs 
						]])
					end, 100)
				end,
			})
		end, config = function() require 'auto-pairs' end, opt = true }

	use { 'windwp/nvim-ts-autotag',	ft = { 'html' }	} -- after = { 'nvim-treesitter' },

	-- use { 'preservim/nerdtree', cmd = {'NERDTreeToggle'}, config = function () vim.cmd('let NERDTreeQuitOnOpen=1') end }

	use { 'norcalli/nvim-colorizer.lua', ft = {'css'}, config = function() require 'colorizer'.setup() end }

	use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate', config = function() require 'highlights.tree-sitter' end } -- event = { "BufRead", "BufWinEnter" },

	use { 'neovim/nvim-lspconfig' }

	use { 'folke/lsp-colors.nvim', after = 'nvim-lspconfig'}

	use { 'williamboman/nvim-lsp-installer', cmd = {'LspInstall', 'LspInstallInfo'}, config = function() require 'lsp.lsp-installer' end }

	use { 'glepnir/dashboard-nvim',	config = function() require 'dashboard' end } 		-- ft = { 'dashboard' }, -- cmd = {	"Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave", },

	--use 'junegunn/fzf'
	--use 'junegunn/fzf.vim'

	use { 'xiyaowong/nvim-transparent', config = function() require 'highlights.transparency' end }

	use { 'p00f/nvim-ts-rainbow' } -- after = { 'nvim-lspconfig' }


--cmp
	use { 'hrsh7th/nvim-cmp', event = { 'InsertEnter', 'CmdlineEnter' }, } --config = function() require 'lsp' end 	after = { 'nvim-lspconfig' }, require 'lsp'
	use { 'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp', }	-- after = { 'nvim-cmp' }
	use { 'L3MON4D3/LuaSnip', event = 'InsertEnter', }
	use { "rafamadriz/friendly-snippets", opt = true,
		setup = function()

			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function()
					vim.defer_fn(function()
						vim.cmd([[
						PackerLoad friendly-snippets
						]])
					end, 100)
				end,
			})
		end,
		config = function()
			require("luasnip/loaders/from_vscode").load({
				paths = {"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets"},})
			end


		}
	use { 'saadparwaiz1/cmp_luasnip', event = { 'InsertEnter', 'CmdlineEnter' }, }
	use { 'hrsh7th/cmp-buffer', event = { 'InsertEnter', 'CmdlineEnter' }, }
	use { 'hrsh7th/cmp-path', event = { 'InsertEnter', 'CmdlineEnter' } }
	use { 'hrsh7th/cmp-cmdline', event = { 'InsertEnter', 'CmdlineEnter' } }


	--use 'declancm/cinnamon.nvim'


	use { 'numToStr/Comment.nvim', keys = { { 'n', 'g' }, { 'v', 'g' } }, config = function () require 'Comment'.setup() end }


	use { 'nvim-treesitter/playground', cmd = {'TSPlaygroundToggle'} }


	use { 'nvim-lua/plenary.nvim', module = 'plenary' }


	use { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons', config = function () require 'devicons' end }


	use { 'nvim-telescope/telescope.nvim' }


	use { 'nvim-lualine/lualine.nvim', after = "gruvbox", config = function () require 'lua-line' end }
	-- use { 'henriquehbr/nvim-startup.lua' }


	use { 'lukas-reineke/indent-blankline.nvim', config = function () require 'highlights.indent' end }


	use { 'nvim-neorg/neorg', tag = "latest", ft = 'norg', after = {'nvim-treesitter','telescope.nvim'}, config = function() require 'extra.neo_org' end }


	use { 'mg979/vim-visual-multi', keys = { {'n','<C-n>'} } }


	use { 'onsails/lspkind.nvim' }


	use { 'ggandor/lightspeed.nvim', keys = { {'n','s'} } }


	use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }


	use { 'folke/which-key.nvim', config = function() require 'maps.whichkey' end }


	use { 'kyazdani42/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeOpen' }, config = function() require 'nvim_tree' end }


	use { 'folke/zen-mode.nvim', cmd = { 'ZenMode' }, config = function() require 'extra.zenmode' end }


	use { 'folke/twilight.nvim', cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' }, config = function() require 'extra.twilights' end }


	use { "max397574/better-escape.nvim", event = { 'InsertEnter' }, config = function() require 'maps.betterescape' end }


	use { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' }, requires = 'kyazdani42/nvim-web-devicons', config = function() require 'lsp.troubles' end }

	use {
		"max397574/colortils.nvim",
		cmd = "Colortils",
		config = function()
			require("colortils").setup()
			vim.cmd('PackerLoad nvim-colorizer.lua')
		end,
	}

	use { 'stevearc/aerial.nvim', after = 'nvim-lspconfig', config = function() require('aerial').setup({filer_kind = false, highlight_on_hover = true,}) end }


	-- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	-- use {'karb94/neoscroll.nvim'}

end,
config = {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end
	}
}
})


