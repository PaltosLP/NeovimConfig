-- vim.cmd([[luafile ~/profiler.nvim/lua/profiler.lua]])


--impatient (for StartUpTime use :StartupTime)
require 'impatient'.enable_profile()

--options
require 'opts'

--colorscheme
vim.g.color_scheme = 'vscode' -- gruvbox, catppuccin, onedark, material, vscode
require 'highlights'

--mappings
require 'maps.mappings'

--packer
require 'plugins'

--lsp
require 'lang'


