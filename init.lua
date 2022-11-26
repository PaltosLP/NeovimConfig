--Personal Configs

require 'impatient'.enable_profile()


vim.g.minimal_config = false
vim.g.user_interface = false



require 'core.opts'
require 'core.plugins'
require 'core.mappings'


vim.cmd.colorscheme("dracula")
-- vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
-- vim.cmd[[highlight NormalFloat  guibg=none]]
-- vim.cmd[[highlight FloatBorder  guibg=none]]
-- vim.cmd[[highlight LineNr guifg=grey guibg=none]]
-- vim.cmd[[highlight SignColumn guibg=none]]
-- vim.api.nvim_set_hl(0, "CursorLineNr", { link = "@function.call" })

require 'charon'
