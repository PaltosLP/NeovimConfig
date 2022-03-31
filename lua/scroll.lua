local status = pcall(require, 'cinnamon')
if not status then
	print('cinnamon Error')
	return
end

require('cinnamon').setup {
  default_keymaps = true,   -- Enable default keymaps.
  extra_keymaps = false,    -- Enable extra keymaps.
  extended_keymaps = false, -- Enable extended keymaps.
  centered = true,    -- Keep cursor centered in window when using window scrolling (arg2):
  disable = false,    -- Disable the plugin.
  scroll_limit = 150, -- Max number of lines moved before scrolling is skipped.
}
