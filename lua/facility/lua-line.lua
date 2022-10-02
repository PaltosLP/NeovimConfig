-- local status = pcall(require, 'lualine')
-- if not status then
--     print('lualine Error')
--     return
-- end


-- require "facility.custom_line"

local custom_catpuccin = require 'highlights.line-color'

local time = os.date()
-- print(time)


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_catpuccin,
	component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
