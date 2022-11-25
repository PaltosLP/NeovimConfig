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
------------------------------------
--Basics
	use { 'wbthomason/packer.nvim' }
	use({ "folke/which-key.nvim",
			config = function() require("which-key").setup {
				window = {
					border = "single", -- none, single, double, shadow
				  },
			} end
		})
	use({ 'dstein64/vim-startuptime', cmd = { 'StartupTime' } })
------------------------------------



------------------------------------
--Colorschemes
  	use { 'Mofiqul/dracula.nvim' }
	use { "catppuccin/nvim", as = "catppuccin", opt=true }
	use { 'morhetz/gruvbox', opt=true }
	use { 'joshdick/onedark.vim', opt=true }
	use { 'Mofiqul/vscode.nvim', opt=true }
	use { 'sainnhe/everforest', opt=true }
------------------------------------



------------------------------------
--Highlights
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require 'core.plugins.treesitter' end,
	})
	use({ 'p00f/nvim-ts-rainbow' })
	use({ "lukas-reineke/indent-blankline.nvim", event='Bufread' })
------------------------------------



------------------------------------
--Editing
	use({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = function() require("nvim-autopairs").setup{} end })
	use({ 'numToStr/Comment.nvim', keys = { { 'n', 'g' }, { 'v', 'g' } }, config = function () require 'Comment'.setup() end })
	use({ 'nvim-tree/nvim-web-devicons' })
	use({ 'kyazdani42/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
		config = function()
			vim.cmd 'highlight NvimTreeNormal guibg=none  gui=bold'
			require("nvim-tree").setup()
		end })
------------------------------------




  if packer_bootstrap then
    require('packer').sync()
  end
end)
