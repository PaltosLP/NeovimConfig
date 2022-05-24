vim.cmd([[luafile ~/profiler.nvim/lua/profiler.lua]])

--impatient (for StartUpTime use :StartupTime)
require 'impatient'.enable_profile()

--options
require 'opts'

--colorscheme
vim.cmd 'colorscheme gruvbox'

--mappings
require 'mappings'

--packer
require 'plugins'

--lsp
require 'lsp'
