
local colorschemes = {
	dracula = 'dracula.nvim',
	darcula = 'darcula.nvim',
	catppuccin = 'catppuccin',
	gruvbox = 'gruvbox',
	onedark = 'onedark.nvim',
	vscode = 'vscode.nvim',
	everforest = 'everforest'
}

-- vim.cmd.PackerLoad(colorschemes[vim.g.color_scheme])
-- vim.cmd[[PackerLoad vscode.nvim]]

if vim.g.color_scheme == 'dracula' then
	vim.api.nvim_set_hl(0, "@variable", { link = "rainbowcol4" })
	-- vim.api.nvim_set_hl(0, "@field", { link = "SpecialKey" })
	vim.api.nvim_set_hl(0, "@keyword.function", { link = "keyword" })

elseif vim.g.color_scheme == 'darcula' then
	vim.g.darcula_italic_comments = true
	vim.g.darcula_italic_keywords = true
	vim.g.darcula_italic_functions = true
	vim.g.darcula_italic_variables = false
	vim.g.darcula_contrast = false
	vim.g.darcula_borders = false
	vim.g.darcula_disable_background = false

elseif vim.g.color_scheme == 'catppuccin' then
	vim.api.nvim_set_hl(0, "@variable", { link = "rainbowcol4" })
	vim.api.nvim_set_hl(0, "@field", { link = "SpecialKey" })
	vim.api.nvim_set_hl(0, "@keyword.function", { link = "keyword" })
end


vim.cmd.colorscheme(vim.g.color_scheme)
vim.cmd('highlight IndentBlanklineChar guifg=#00FF00 gui=nocombine')
