--Coordinate lua folder

require 'completion'

if vim.g.minimal_config then
	require 'minimal'
	return
end

if vim.g.user_interface then
	require 'ui'
end
