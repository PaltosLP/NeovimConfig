local colors = nil

local catpuccin_colors = {
	black        = '#1E1E2E',
	white        = '#C6A0F6',
	red          = '#ED8796',
	green        = '#A6DA95',
	yellow       = '#EED49F',
	gray         = '#7287FD',
	darkgray     = '#232634',
	lightgray    = '#4C4F69',
	inactivegray = '#7c6f64',
}

local vscode_colors = {
	black        = '#1E1E2E',
	white        = '#CE9178',
	red          = '#F44747',
	green        = '#6A9955',
	yellow       = '#DCDCAA',
	gray         = '#1895ff',
	darkgray     = '#232634',
	lightgray    = '#4C4F69',
	inactivegray = '#7c6f64',
}



if vim.g.color_scheme == 'catppuccin' then
	colors = catpuccin_colors
elseif vim.g.color_scheme == 'vscode' then
	colors = vscode_colors
end

return {
  normal = {
    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.darkgray , fg = colors.gray}
  },
  insert = {
    a = {bg = colors.green , fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.darkgray , fg = colors.green}
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.darkgray , fg = colors.yellow}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.black, fg = colors.red}
  },
  command = {
    a = {bg = colors.red , fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.darkgray , fg = colors.red}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.gray},
    c = {bg = colors.darkgray, fg = colors.gray}
  }
}
