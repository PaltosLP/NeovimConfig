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


	-- configure it
	require("catppuccin").setup({
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = true,
	term_colors = true,
	compile = {
		enabled = false,
		path = vim.fn.stdpath "cache" .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		lsp_trouble = false,
		cmp = true,
		lsp_saga = true,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = true,
		},
		neotree = {
			enabled = false,
			show_root = true,
			transparent_panel = false,
		},
		dap = {
			enabled = false,
			enable_ui = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = true,
		bufferline = false,
		markdown = true,
		lightspeed = true,
		ts_rainbow = true,
		aerial = false,
	},
	color_overrides = {},
	highlight_overrides = {},
})

	vim.cmd [[colorscheme catppuccin]]


elseif vim.g.color_scheme == "vscode" then

	-- Lua:
	-- For dark theme (neovim's default)
	vim.o.background = 'dark'
	-- For light theme
	-- vim.o.background = 'light'

	local c = require('vscode.colors')
	require('vscode').setup({
		-- Enable transparent background
		transparent = false,

		-- Enable italic comment
		italic_comments = true,

		-- Disable nvim-tree background color
		disable_nvimtree_bg = false,

		-- Override colors (see ./lua/vscode/colors.lua)
		-- color_overrides = {
		-- 	vscLineNumber = '#FFFFFF',
		-- },

		-- Override highlight groups (see ./lua/vscode/theme.lua)
		group_overrides = {
			-- this supports the same val table as vim.api.nvim_set_hl
			-- use colors from this colorscheme by requiring vscode.colors!
			Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
		}
	})

end



