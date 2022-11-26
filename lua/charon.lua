--Coordinate lua folder

require 'completion'
require 'highlights'


if vim.g.minimal_config then
	require 'minimal'
	return
end

if vim.g.user_interface then
	require 'ui'
end

if vim.g.transparent then
	vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
	vim.cmd[[highlight NormalFloat  guibg=none]]
	vim.cmd[[highlight FloatBorder  guibg=none]]
	vim.cmd[[highlight LineNr guifg=grey guibg=none]]
	vim.cmd[[highlight SignColumn guibg=none]]
	vim.api.nvim_set_hl(0, "CursorLineNr", { link = "@function.call" })
end
