

local function snip()
	-- vim.cmd.PackerLoad('friendly-snippets')
	-- require("lazy").load("plugins = friendly-snippets")
	vim.cmd("Lazy load friendly-snippets")
end

local function folds()
	-- vim.cmd.PackerLoad('nvim-ufo')
	vim.cmd("Lazy load nvim-ufo")
end

local function movements()
	-- vim.cmd.PackerLoad('move.nvim')
	vim.cmd("Lazy load move.nvim")
end

local wk = require("which-key")

wk.add({
    { "<leader>l", group = "Load" },
    { "<leader>lc", "<cmd>ColorizerToggle<Cr>", desc = "Load Colorizer" },
    { "<leader>lf", function() folds() end, desc = "Load Folding" },
    { "<leader>lm", function() movements() end, desc = "Load Move" },
    { "<leader>ls", function() snip() end, desc = "Load Snippets" },
})


vim.api.nvim_create_autocmd('CmdlineEnter',{
	command = 'lua vim.opt.cmdheight = 1'
})

vim.api.nvim_create_autocmd('CmdlineLeave',{
	command = 'lua vim.opt.cmdheight = 0'
})

vim.api.nvim_create_user_command("Vscode",
	 function()
		vim.cmd("NvimTreeToggle")
		vim.cmd("ToggleTerm")
	end
, {} )

vim.api.nvim_create_user_command("Transparent",
	 function()
		vim.cmd.highlight("Normal guibg=none")
		vim.cmd.highlight("Statusline guibg=none")
		vim.cmd.highlight("TabLine guibg=none")
		vim.cmd.highlight("TabLineFill guibg=none")
		vim.cmd.highlight("Statusline guibg=none")
		vim.cmd [[highlight IndentBlanklineIndent1 guibg=none gui=nocombine]]
		vim.cmd [[highlight IndentBlanklineIndent2 guibg=none gui=nocombine]]
		vim.cmd('highlight IndentBlanklineChar guifg=comment gui=nocombine')
		vim.cmd.highlight("Signcolumn guibg=none")
	end
, {} )

if vim.g.transparent == true then
	vim.cmd("Transparent")
end
