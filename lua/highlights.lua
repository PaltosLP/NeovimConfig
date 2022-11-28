
local colorschemes = {
	dracula = 'dracula.nvim',
	catppuccin = 'catppuccin',
	gruvbox = 'gruvbox',
	onedark = 'onedark.nvim',
	vscode = 'vscode.nvim',
	everforest = 'everforest'
}

-- vim.cmd.PackerLoad(colorschemes[vim.g.color_scheme])

if vim.g.color_scheme == 'dracula' then
	vim.api.nvim_set_hl(0, "@variable", { link = "rainbowcol4" })
	-- vim.api.nvim_set_hl(0, "@field", { link = "SpecialKey" })
	vim.api.nvim_set_hl(0, "@keyword.function", { link = "keyword" })



elseif vim.g.color_scheme == 'catppuccin' then
	vim.api.nvim_set_hl(0, "@variable", { link = "rainbowcol4" })
	vim.api.nvim_set_hl(0, "@field", { link = "SpecialKey" })
	vim.api.nvim_set_hl(0, "@keyword.function", { link = "keyword" })
end


vim.cmd.colorscheme(vim.g.color_scheme)