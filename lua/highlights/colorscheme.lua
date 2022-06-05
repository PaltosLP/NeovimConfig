
local color_scheme = vim.g.colors_name

-- Lua
require("lsp-colors").setup({
	Error = "#db4b4b",
	-- Error = "#8C0164",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981"
})


if color_scheme == 'onedark' then
	do end

elseif color_scheme == 'gruvbox' then
	do end

elseif color_scheme == 'material' then
	vim.g.material_style = "palenight" -- darker, lighter, oceanic, palenight, deep ocean
	vim.cmd[[colorscheme material]]
	require('material').setup{
	custom_highlights = {
		CursorLine = { fg = '#0000FF', gui = 'underline' },
		}
	}
elseif color_scheme == 'nord' then
	do end

elseif color_scheme == 'papercolor-theme' then
	do end

elseif color_scheme == 'tokyonight-vim' then
	vim.cmd 'let g:tokyonight_style = "night"'
	vim.cmd 'let g:tokyonight_enable_italic = 1'

elseif color_scheme == 'everforest' then
	vim.o.background = 'dark'
	vim.cmd('let g:everforest_background = "hard"')
	vim.cmd('let g:everforest_better_performance = 1')

elseif color_scheme == 'onenord' then
	do end

elseif color_scheme == 'catppuccin' then

	vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
	-- vim.cmd[[colorscheme catppuccin]]

	local catppuccin = require("catppuccin")

	-- configure it
	catppuccin.setup({
	transparent_background = true,
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = true,
		cmp = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = true,
		markdown = true,
		lightspeed = true,
		ts_rainbow = true,
	}
	})

end
