
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
	-- vim.cmd[[colorscheme onedark]]
end

if color_scheme == 'gruvbox' then
	-- vim.cmd[[colorscheme gruvbox]]
end

if color_scheme == 'catppuccin' then

	vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
	-- vim.cmd[[colorscheme catppuccin]]

	local catppuccin = require("catppuccin")

	-- configure it
	catppuccin.setup({
	transparent_background = true,
	term_colors = false,
	styles = {
		-- italic, bold, underline
		comments = "italic",
		conditionals = "bold",
		loops = "NONE",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},
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
		lsp_saga = false,
		gitgutter = false,
		gitsigns = false,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		neotree = {
			enabled = false,
			show_root = false,
			transparent_panel = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = true,
		lightspeed = true,
		ts_rainbow = true,
		hop = false,
		notify = true,
		telekasten = true,
		symbols_outline = true,
	}
	})

end
