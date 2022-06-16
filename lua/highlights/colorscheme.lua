if vim.g.color_scheme == 'onedark' then
	vim.cmd[[colorscheme onedark]]

elseif vim.g.color_scheme == 'gruvbox' then
	vim.cmd[[colorscheme gruvbox]]

elseif vim.g.color_scheme == 'material' then
	vim.g.material_style = "palenight" -- darker, lighter, oceanic, palenight, deep ocean
	vim.cmd[[colorscheme material]]
	require('material').setup{
	custom_highlights = {
		CursorLine = { fg = '#0000FF', gui = 'underline' },
		}
	}
	vim.cmd[[colorscheme material]]

elseif vim.g.color_scheme == 'nord' then
	vim.cmd[[colorscheme nord]]

elseif vim.g.color_scheme == 'papercolor-theme' then
	vim.cmd[[colorscheme papercolor-theme]]

elseif vim.g.color_scheme == 'tokyonight-vim' then
	vim.cmd 'let g:tokyonight_style = "night"'
	vim.cmd 'let g:tokyonight_enable_italic = 1'
	vim.cmd[[colorscheme tokyonight-vim]]

elseif vim.g.color_scheme == 'everforest' then
	vim.o.background = 'dark'
	vim.cmd('let g:everforest_background = "hard"')
	vim.cmd('let g:everforest_better_performance = 1')
	vim.cmd[[colorscheme everforest]]

elseif vim.g.color_scheme == 'onenord' then
	vim.cmd[[colorscheme onenord]]

elseif vim.g.color_scheme == 'catppuccin' then

	vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
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
		ts_rainbow = true,
	}
	})
	vim.cmd[[colorscheme catppuccin]]
end


-- Lua
-- require("lsp-colors").setup({
-- 	Error = "#db4b4b",
-- 	-- Error = "#8C0164",
-- 	Warning = "#e0af68",
-- 	Information = "#0db9d7",
-- 	Hint = "#10B981"
-- })
