vim.cmd([[luafile ~/profiler.nvim/lua/profiler.lua]])

--Impatient
require'impatient' --.enable_profile()


--Options
require 'opts'


--Colorscheme
vim.g.color_scheme = 'catppuccin'
require 'highlights'


--Mappings
require 'maps.mappings'


--Plugins
require "plugins"


--FileType specifications
require 'lang'
