--create and pass status and TabLine
local tab = require 'ui.tabline'
local stat = require 'ui.statusline'


local TabLine = { tab.TabLineOffset, tab.BufferLine, tab.TabPages }
local StatusLine = { stat.ViMode, stat.left_seperator, stat.Git, stat.left_seperator, stat.FileNameBlock,  stat.Diagnostics, stat.FileIcon, stat.right_seperator, stat.LSPActive, stat.right_seperator, stat.Time, stat.ScrollBar }


require'heirline'.setup( StatusLine, nil, TabLine )


vim.api.nvim_create_autocmd('InsertLeave', {
	callback = function()
		require'heirline'.setup(StatusLine)
	end
})
