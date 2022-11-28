--Heirline Config
--https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md

-- local StatusLine = {
-- {...}, {...}, {..., {...}, {...}, {..., {...}, {..., {...}}}}
-- }
local StatusLine = {{first = "Hello World"}}

local WinBar = {{...}, {{...}, {...}}}

local TabLine = {{...}, {...}, {...}}

-- the winbar parameter is optional!
-- require'heirline'.setup(StatusLine, WinBar, TabLine)
require'heirline'.setup(StatusLine)
