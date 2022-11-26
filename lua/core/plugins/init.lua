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
------------------------------------------------------------------------



------------------------------------------------------------------------
--UI
	use { "nvim-lua/plenary.nvim", opt=true }
	use { 'MunifTanjim/nui.nvim', opt=true  }
	use { 'folke/zen-mode.nvim', cmd = { 'ZenMode' }, config = function() require 'extra.zenmode' end, opt=true }
	use { 'folke/twilight.nvim', cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' }, config = function() require 'extra.twilights' end, opt=true }
	use({ "folke/noice.nvim", opt=true, config = function() require("noice").setup() require("notify").setup({ background_colour = "#000000" }) end,
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
