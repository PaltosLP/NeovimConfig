--disable builtin, default opts
require 'core.opts'


--setup packer
require 'core.pack'


--setup basic editor plugins
local packer = require("packer")
packer.use({ 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup{} end })
packer.use({ 'numToStr/Comment.nvim', keys = { { 'n', 'g' }, { 'v', 'g' } }, config = function () require 'Comment'.setup() end })
packer.use({ 'kyazdani42/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
		config = function()
			vim.cmd 'highlight NvimTreeNormal guibg=none  gui=bold'
			require("nvim-tree").setup()
		end,
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		  },
})
vim.api.nvim_set_keymap('n', '<C-t>', "<cmd>NvimTreeToggle<Cr>", {})


--setup highlights
require 'core.highlights'


--mappings
require 'core.maps.basemaps'


--lsp
require 'core.lsp'


--check if minimal config is set
if vim.g.minimal_config then
	return
end

require "charon"
