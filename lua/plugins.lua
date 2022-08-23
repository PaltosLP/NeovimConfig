
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup({function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'lewis6991/impatient.nvim' }
	-- use { 'nathom/filetype.nvim', config = function() require'filetype'.setup({}) end }
	use { "nvim-lua/plenary.nvim" }
	use { 'MunifTanjim/nui.nvim', after = 'fine-cmdline.nvim' }
	use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }


--colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'morhetz/gruvbox', cmd = { 'colorscheme' } }
	use { 'joshdick/onedark.vim' }
	use { 'marko-cerovac/material.nvim', cmd = { 'colorscheme' } }
	use { 'shaunsingh/nord.nvim', cmd = { 'colorscheme' } }
	use { 'NLKNguyen/papercolor-theme', cmd = { 'colorscheme' } }
	use { 'ghifarit53/tokyonight-vim', cmd = { 'colorscheme' }}
	use { 'sainnhe/everforest', cmd = { 'colorscheme' } }
	use { 'rmehri01/onenord.nvim', cmd = { 'colorscheme' } }

--highlights
	use { 'xiyaowong/nvim-transparent', config = function() require 'highlights.transparency' end }
	use { 'lukas-reineke/indent-blankline.nvim' }--, config = function () require 'highlights.indent' end
	use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }--, config = function() require 'highlights.tree_sitter' end
	use { 'nvim-treesitter/playground', cmd = {'TSPlaygroundToggle'} }
	--use { 'folke/lsp-colors.nvim', after = 'nvim-lspconfig' }
	use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
	-- use { 'mvllow/modes.nvim', config = function() require('modes').setup() end }


--Mappings
	use { 'folke/which-key.nvim', config = function() require 'maps.whichkey' end }
	use { "max397574/better-escape.nvim", event = { 'InsertEnter' }, config = function() require 'maps.betterescape' end }


--AutoPairs
	use { 'windwp/nvim-autopairs',
			config = function() require("nvim-autopairs").setup{} end
		-- 	setup = function()
		--
		-- 	vim.api.nvim_create_autocmd("InsertEnter", {
		-- 		callback = function()
		-- 			vim.defer_fn(function()
		-- 				vim.cmd([[
		-- 				PackerLoad nvim-autopairs
		-- 				]])
		-- 			end, 100)
		-- 		end,
		-- 	})
		-- end, config = function() require'nvim-autopairs'.setup{} end, opt = true
		}




-- LSP Completion Snippets
local opt = true
local event = { 'InsertEnter', 'CmdlineEnter' }
	use { 'neovim/nvim-lspconfig' }

	use { 'hrsh7th/nvim-cmp', opt = opt, event = event } --, event = event
	use { 'hrsh7th/cmp-nvim-lsp', opt = opt, event = event } --, event = event
	use { 'hrsh7th/cmp-buffer', opt = opt, event = event } --, event = event
	use { 'hrsh7th/cmp-path', opt = opt, event = event }  --, event = event
	use { 'hrsh7th/cmp-cmdline', opt = opt, event = event } --, event = event
	use { 'L3MON4D3/LuaSnip', opt = opt, event = event } --, event = event
	use { 'saadparwaiz1/cmp_luasnip', opt = opt, event = event } --, event = event

	use { 'onsails/lspkind.nvim' } --, event = event


--	use { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' }, requires = 'kyazdani42/nvim-web-devicons', config = function() require 'lsp.troubles' end }
	use { 'williamboman/nvim-lsp-installer', cmd = {'LspInstall', 'LspInstallInfo'}, config = function() require 'lsp.lsp-installer' end }

	use { 'windwp/nvim-ts-autotag',	ft = { 'html' }	}
	use { 'norcalli/nvim-colorizer.lua', cmd = { 'ColorizerToggle' }, ft = {'css'}, config = function() require 'colorizer'.setup() end }

	use { "rafamadriz/friendly-snippets", event = "InsertCharPre", config = function() require("luasnip/loaders/from_vscode").load({
		paths = {
			"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
			},
		})
		end } --, opt = true
		-- setup = function()
		--
		-- 	vim.api.nvim_create_autocmd("InsertEnter", {
		-- 		callback = function()
		-- 			vim.defer_fn(function()
		-- 				vim.cmd([[
		-- 				PackerLoad friendly-snippets
		-- 				]])
		-- 			end, 100)
		-- 		end,
		-- 	})
		-- end,
		-- config = function()
		-- 	require("luasnip/loaders/from_vscode").load({
		-- 		paths = {"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets"},})
		-- 	end
		--
		--



--facility
	use { 'nvim-telescope/telescope.nvim' }
	use { 'numToStr/Comment.nvim', keys = { { 'n', 'g' }, { 'v', 'g' } }, config = function () require 'Comment'.setup() end }
	use { 'ggandor/lightspeed.nvim', keys = { {'n','s'} } }
	use { 'nvim-lualine/lualine.nvim', after = "catppuccin", config = function () require 'facility.lua-line' end }
	use { 'mg979/vim-visual-multi', keys = { {'n','<C-n>'} } }
	use { 'matze/vim-move', keys = { {'n','<A-k>'}, {'n', '<A-j>'}, {'n', '<A-h>'}, {'n', '<A-l>'} } }
	use { 'kyazdani42/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeOpen' }, config = function() require 'facility.nvim_tree' end }
	use {
		"max397574/colortils.nvim",
		cmd = "Colortils",
		config = function()
			require("colortils").setup()
			vim.cmd('PackerLoad nvim-colorizer.lua')
		end,
	}
	use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end } --, cmd = 'Gitsigns'
	use { "akinsho/toggleterm.nvim", cmd = { 'ToggleTerm' }, tag = 'v1.*', config = function() require("facility.toggle-term") end}
	-- use { 'arjunmahishi/run-code.nvim', cmd = { 'RunCodeSelected', 'RunCodeFile'} }
	-- use { 'tpope/vim-surround' } --keys = { {'n','s'} }




--extra

	use { 'glepnir/dashboard-nvim', config = function() require 'extra.dashboard' end }
	use { 'nvim-neorg/neorg', tag = "latest", ft = 'norg', after = {'nvim-treesitter','telescope.nvim'}, config = function() require 'extra.neo_org' end }
	use { 'folke/zen-mode.nvim', cmd = { 'ZenMode' }, config = function() require 'extra.zenmode' end }
	use { 'folke/twilight.nvim', cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' }, config = function() require 'extra.twilights' end }
	use { 'VonHeikemen/fine-cmdline.nvim' , cmd = { 'FineCmdline' } }
	use { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons', config = function () require 'extra.devicons' end }
	use { 'tami5/lspsaga.nvim', branch = 'main', config = function() require "extra.lsp-saga"  end }
	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}


end,
config = {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end
	}
}
}
)
