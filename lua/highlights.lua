
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
	-- vim.api.nvim_set_hl(0, "@variable", { link = "rainbowcol4" })
	-- vim.api.nvim_set_hl(0, "@field", { link = "SpecialKey" })
	-- vim.api.nvim_set_hl(0, "@keyword.function", { link = "keyword" })
	require("dracula").setup({italic_comment = true,show_end_of_buffer = true})

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



if vim.g.color_scheme == "onedark" then
	require('onedark').setup {
    	style = 'warmer', --'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		code_style = {
			comments = 'italic',
			keywords = 'italic,bold',
			functions = 'bold',
			strings = 'none',
			variables = 'none'
		},
	}

	-- vim.cmd('lua vim.api.nvim_set_hl(0, "@variable", { fg = "#dbb671" })')

	require('onedark').load()
	vim.api.nvim_set_hl(0, "@variable", { fg = "#dbb671" })
	vim.api.nvim_set_hl(0, "@function", { link = "property" })
	vim.api.nvim_set_hl(0, "@function.call", { link = "Special" })
	vim.api.nvim_set_hl(0, "@type.builtin", { italic = true, fg="#c49060" })
	vim.api.nvim_set_hl(0, "@type", { italic = true, fg="#c49060" })

else
	vim.cmd.colorscheme(vim.g.color_scheme)
end
