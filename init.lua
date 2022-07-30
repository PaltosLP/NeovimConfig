vim.cmd([[luafile ~/profiler.nvim/lua/profiler.lua]])

--impatient (for StartUpTime use :StartupTime)
require 'impatient'.enable_profile()

--options
require 'opts'

--colorscheme
vim.g.color_scheme = 'catppuccin' -- gruvbox, catppuccin, onedark, material
require 'highlights'

--mappings
require 'maps.mappings'

--packer
require 'plugins'

--lsp
require 'lang'


-- local function win()
--
-- 	vim.api.nvim_open_win(0, false, {relative='win', row=3, col=3, width=12, height=3})
--
-- end
--
-- win()

