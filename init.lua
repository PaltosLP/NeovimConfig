
vim.cmd([[luafile ~/profiler.nvim/lua/profiler.lua]])

--impatient (for StartUpTime use :StartupTime)
require 'impatient'.enable_profile()

--options
require 'opts'

--colorscheme
-- vim.cmd[[colorscheme gruvbox]]
vim.g.color_scheme = 'catppuccin' -- gruvbox, catppuccin, onedark, material
require 'highlights.colorscheme'

--mappings
require 'maps.mappings'

--packer
require 'plugins'

--lsp
-- require 'lsp'


-- vim.cmd([[
-- autocmd BufWinEnter * startinsert
-- autocmd BufWinEnter * startnormal
-- ]])
