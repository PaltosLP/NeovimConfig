local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
   lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- example using a list of specs with the default options
-- vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

local ui_opt = not vim.g.user_interface

require("lazy").setup({

	{ "folke/which-key.nvim",
		config = function()
      		require("which-key").setup({
				window = {
 					border = "single", -- none, single, double, shadow
 				  },
			  })
    	end,
	},

	{ 'Mofiqul/dracula.nvim' },



------------------------------------------------------------------------
--Basics
	-- { 'lewis6991/impatient.nvim' },
------------------------------------------------------------------------



------------------------------------------------------------------------
--Devtools
	{ 'nvim-treesitter/playground', cmd = {'TSPlaygroundToggle'}, lazy=true },
	({ 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }),
------------------------------------------------------------------------


------------------------------------------------------------------------
--Colorschemes
--   	use { 'Mofiqul/dracula.nvim', opt=false}
-- 	use { 'Hierosme/darcula.nvim' }
-- 	use { "catppuccin/nvim", as = "catppuccin", opt=true }
-- 	use { 'morhetz/gruvbox', opt=true }
-- 	use { 'joshdick/onedark.vim', opt=true }
-- 	use { 'Mofiqul/vscode.nvim', opt=true }
-- 	use { 'sainnhe/everforest', opt=true }
------------------------------------------------------------------------



------------------------------------------------------------------------
--Highlights
	({
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function() require 'core.plugins.treesitter' end,
	}),
	({ 'p00f/nvim-ts-rainbow' }),
	({ "lukas-reineke/indent-blankline.nvim", config = function()
			require("indent_blankline").setup({
				-- for example, context is off by default, use this to turn it on
				-- show_current_context = true,
				-- show_current_context_start = true,
				char = "",
				char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
				},
				space_char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
				},
				show_trailing_blankline_indent = false,
						})
			vim.cmd [[highlight IndentBlanklineIndent1 guibg=#282a36 gui=nocombine]]
			vim.cmd [[highlight IndentBlanklineIndent2 guibg=#252732 gui=nocombine]]
			vim.cmd('highlight IndentBlanklineChar guifg=comment gui=nocombine')
		end }), --, event='Bufread' #00FF00
------------------------------------------------------------------------


------------------------------------------------------------------------
-- --Editing
	({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = function() require("nvim-autopairs").setup{} end }),
	({ 'numToStr/Comment.nvim', keys = { "gcc",{"gc", mode = "v"} }, config = function () require 'Comment'.setup() end }),
	({ 'nvim-tree/nvim-web-devicons', lazy=true }),
 	({ 'kyazdani42/nvim-tree.lua',  cmd = { 'NvimTreeToggle', 'NvimTreeOpen'},
		config = function()
			vim.cmd 'highlight NvimTreeNormal guibg=none  gui=bold'
			require("nvim-tree").setup()
		end }),
------------------------------------------------------------------------


------------------------------------------------------------------------
--LSP, Completion, Snippets
	{ 'neovim/nvim-lspconfig',  config = function() require('core.plugins.lsp') end }, --event='VimEnter',
	({ "glepnir/lspsaga.nvim",
			cmd = 'Lspsaga',
			branch = "main",
			config = function()
				local saga = require("lspsaga")

				saga.init_lsp_saga({
					-- your configuration
				})
			end,
		}),


	({ 'hrsh7th/nvim-cmp', config = function() require 'completion.comp' require 'completion.snips' end, event = { 'InsertEnter', 'CmdlineEnter'} }),
	{ 'hrsh7th/cmp-nvim-lsp', event = { 'InsertEnter' } },
	{ 'hrsh7th/cmp-buffer', event = { 'InsertEnter', 'CmdlineEnter'} },
	{ 'hrsh7th/cmp-path', event = { 'InsertEnter', 'CmdlineEnter'} },
	{ 'hrsh7th/cmp-cmdline', event = {'CmdlineEnter'} },
	{ 'L3MON4D3/LuaSnip', event = { 'InsertEnter' } },
	{ 'saadparwaiz1/cmp_luasnip', event = { 'InsertEnter' } },
	{ 'onsails/lspkind.nvim',lazy=true },

	{ 'windwp/nvim-ts-autotag',	ft = { 'html' }	},
	{ 'norcalli/nvim-colorizer.lua', cmd = { 'ColorizerToggle' }, ft = {'css'},
	config = function() require 'colorizer'.setup() end, keys={ 'lc' }
	},

	({ "rafamadriz/friendly-snippets", lazy=true, config = function() require("luasnip/loaders/from_vscode").load({
		paths = {
			"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
			},
		})
		end, keys={'<leader>ls'},
	}),
------------------------------------------------------------------------


----------------------------------------------------------------------
--Telescope
	({'nvim-telescope/telescope.nvim', version = '0.1.0', dependencies = { 'nvim-lua/plenary.nvim' },
 	 cmd = 'Telescope', lazy=true }), --, keys = {{'n', '<leader>f'}}, opt=true
	({'nvim-telescope/telescope-ui-select.nvim', lazy=true }),
	({'nvim-telescope/telescope-fzf-native.nvim', build= 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build', lazy=true }),
------------------------------------------------------------------------



------------------------------------------------------------------------
--Additions
	({ 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end, lazy=false }),
	({ "akinsho/toggleterm.nvim", cmd = { 'ToggleTerm' }, version = '*', config = function() require('toggleterm').setup({open_mapping = [[<c-e>]]}) end }), --vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>ToggleTerm<Cr>', {})
	({ "iamcco/markdown-preview.nvim", build = "cd app && npm install", init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } }),
	({ "kylechui/nvim-surround", version = "*", config = function() require("nvim-surround").setup({}) end, lazy=true }),
	({ 'ggandor/lightspeed.nvim', keys = { 's' } }),
	({ 'mg979/vim-visual-multi', keys = { '<C-n>'} }), --keys = { {'n','<C-n>'}, {'v', 'C-n'} }
	({ 'fedepujol/move.nvim', config = function() require("core.plugins.move") end,
		lazy=true, cmd = { "MoveLine", "MoveBlock", "MoveHChar", "MoveHBlock" } }), --keys = { {'n','<A-k>'}, {'n', '<A-j>'}, {'n', '<A-h>'}, {'n', '<A-l>'} }
	({ "max397574/colortils.nvim", cmd = "Colortils",
	  config = function()
		require("colortils").setup()
	  end,
		}),
------------------------------------------------------------------------



------------------------------------------------------------------------
--UI
	({ "rebelot/heirline.nvim" }),
	({'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', keys = { 'zM '}, --keys = { {'n','zM'}, {'n', "lz"} },
	config=function()
		require 'core.plugins.ufo'
	end }),
	{ 'kevinhwang91/promise-async', lazy=true },


	{ "nvim-lua/plenary.nvim" },
	{ 'MunifTanjim/nui.nvim', lazy=ui_opt},
	{ 'folke/zen-mode.nvim', cmd = { 'ZenMode' }, config = function() require 'extra.zenmode' end, lazy=ui_opt},
	{ 'folke/twilight.nvim', cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' }, config = function() require 'extra.twilights' end, lazy=ui_opt},
	({ "folke/noice.nvim", lazy=ui_opt , config = function() require("noice").setup() require("notify").setup({ background_colour = "#000000" }) end,
					dependencies = {
					-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
					-- "MunifTanjim/nui.nvim",
					-- OPTIONAL:
					--   `nvim-notify` is only needed, if you want to use the notification view.
					--   If not available, we use `mini` as the fallback
					"rcarriga/nvim-notify",
					},


			}),
------------------------------------------------------------------------



------------------------------------------------------------------------
--Random
	({ 'tamton-aquib/duck.nvim', lazy=true }),
	({ 'eandrju/cellular-automaton.nvim', cmd = 'CellularAutomaton' }),

------------------------------------------------------------------------

})
