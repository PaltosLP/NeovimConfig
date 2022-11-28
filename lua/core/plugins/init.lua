local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
------------------------------------------------------------------------
--Basics
	use { 'wbthomason/packer.nvim' }
	use { 'lewis6991/impatient.nvim' }
	use({ "folke/which-key.nvim",
			config = function() require("which-key").setup {
				window = {
					border = "single", -- none, single, double, shadow
				  },
			} end
		})
------------------------------------------------------------------------



------------------------------------------------------------------------
--Devtools
	use { 'nvim-treesitter/playground', cmd = {'TSPlaygroundToggle'} }
	use({ 'dstein64/vim-startuptime', cmd = { 'StartupTime' } })
------------------------------------------------------------------------



------------------------------------------------------------------------
--Colorschemes
  	use { 'Mofiqul/dracula.nvim' }
	use { "catppuccin/nvim", as = "catppuccin", opt=true }
	use { 'morhetz/gruvbox', opt=true }
	use { 'joshdick/onedark.vim', opt=true }
	use { 'Mofiqul/vscode.nvim', opt=true }
	use { 'sainnhe/everforest', opt=true }
------------------------------------------------------------------------



------------------------------------------------------------------------
--Highlights
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require 'core.plugins.treesitter' end,
	})
	use({ 'p00f/nvim-ts-rainbow' })
	use({ "lukas-reineke/indent-blankline.nvim", event='Bufread' })
------------------------------------------------------------------------



------------------------------------------------------------------------
--Editing
	use({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = function() require("nvim-autopairs").setup{} end })
	use({ 'numToStr/Comment.nvim', keys = { { 'n', 'g' }, { 'v', 'g' } }, config = function () require 'Comment'.setup() end })
	use({ 'nvim-tree/nvim-web-devicons', module='nvim-web-devicons' } )
	use({ 'kyazdani42/nvim-tree.lua',  cmd = { 'NvimTreeToggle', 'NvimTreeOpen'},
		config = function()
			vim.cmd 'highlight NvimTreeNormal guibg=none  gui=bold'
			require("nvim-tree").setup()
		end })
------------------------------------------------------------------------



------------------------------------------------------------------------
--LSP, Completion, Snippets
	use { 'neovim/nvim-lspconfig',  config = function() require('core.plugins.lsp') end } --event='VimEnter',
	use({"glepnir/lspsaga.nvim",
			module = "lspsaga.nvim",
			branch = "main",
			config = function()
				local saga = require("lspsaga")

				saga.init_lsp_saga({
					-- your configuration
				})
			end,
		})


	use { 'hrsh7th/nvim-cmp', opt = true }
	use { 'hrsh7th/cmp-nvim-lsp', opt = true }
	use { 'hrsh7th/cmp-buffer', opt = true }
	use { 'hrsh7th/cmp-path', opt = true }
	use { 'hrsh7th/cmp-cmdline', opt = true }
	use { 'L3MON4D3/LuaSnip', opt = true }
	use { 'saadparwaiz1/cmp_luasnip', opt = true }
	use { 'onsails/lspkind.nvim', opt=true }

	use { 'windwp/nvim-ts-autotag',	ft = { 'html' }	}
	use { 'norcalli/nvim-colorizer.lua', cmd = { 'ColorizerToggle' }, ft = {'css'}, config = function() require 'colorizer'.setup() end }

	use { "rafamadriz/friendly-snippets", opt=true, config = function() require("luasnip/loaders/from_vscode").load({
		paths = {
			"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
			},
		})
		end }
------------------------------------------------------------------------



------------------------------------------------------------------------
--Telescope
	use({'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }, keys = {{'n', '<leader>f'}}, opt=true })
	use({'nvim-telescope/telescope-ui-select.nvim', opt=true })
	use({'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build', opt=true })
------------------------------------------------------------------------



------------------------------------------------------------------------
--Additions
	use({ 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end, opt=true })
	use({ "akinsho/toggleterm.nvim", cmd = { 'ToggleTerm' }, tag = '*', config = function() require('toggleterm').setup({open_mapping = [[<c-e>]]}) end }) --vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>ToggleTerm<Cr>', {})
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } })
	use({ "kylechui/nvim-surround", tag = "*", config = function() require("nvim-surround").setup({}) end, opt=true })
	use({ 'ggandor/lightspeed.nvim', keys = { {'n','s'} } })
	use({ 'mg979/vim-visual-multi', keys = { {'n','<C-n>'}, {'v', 'C-n'} } })
	use({ 'fedepujol/move.nvim', config = function() require("core.plugins.move") end, opt=true }) --keys = { {'n','<A-k>'}, {'n', '<A-j>'}, {'n', '<A-h>'}, {'n', '<A-l>'} }
------------------------------------------------------------------------



------------------------------------------------------------------------
--UI
local ui_opt = not vim.g.user_interface
	use { "nvim-lua/plenary.nvim", opt=ui_opt}
	use { 'MunifTanjim/nui.nvim', opt=ui_opt}
	use { 'folke/zen-mode.nvim', cmd = { 'ZenMode' }, config = function() require 'extra.zenmode' end, opt=ui_opt}
	use { 'folke/twilight.nvim', cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' }, config = function() require 'extra.twilights' end, opt=ui_opt}
	use({ "folke/noice.nvim", opt=ui_opt , config = function() require("noice").setup() require("notify").setup({ background_colour = "#000000" }) end,
					requires = {
					-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
					-- "MunifTanjim/nui.nvim",
					-- OPTIONAL:
					--   `nvim-notify` is only needed, if you want to use the notification view.
					--   If not available, we use `mini` as the fallback
					"rcarriga/nvim-notify",
					},


			})
------------------------------------------------------------------------

  if packer_bootstrap then
    require('packer').sync()
  end
end)
