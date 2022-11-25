
vim.g.mapleader = ' '


--Neovim Docs
--{lhs}	means left-hand-side
--{rhs}	means right-hand-side
--Wrapper for keymaps
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--clear search highlights
map('n', '<ESC>', ':nohl<CR>')

--basics
map('n', '<C-a>', '<cmd>call run_file#Run_File()<Cr>')
map('n', '<C-s>', '<cmd>call save#w()<Cr>')
map('n', '<C-l>', '<cmd>q<Cr>')
map('v', '<C-c>', '"*y<Cr>') --needs x server


--local ok, _ = pcall(require, 'which-key.nvim')
--if not ok then
--	--quit
--	map('n', '<leader>qq', '<cmd>q<Cr>')
--	map('n', '<leader>qf', '<cmd>q!<Cr>')
--	map('n', '<leader>qw', '<cmd>wq<Cr>')
--	return
--end



vim.api.nvim_set_keymap("n", "<leader>?", "<cmd>WhichKey<CR>", {})
vim.api.nvim_set_keymap('n', '<C-t>', "<cmd>NvimTreeToggle<Cr>", {})

local wk = require("which-key")
wk.register({
	q = {
		name = 'Quit',
		q = { "<cmd>q<Cr>", "Quit" },
		f = { "<cmd>q!<Cr>", "Unsaved Quit" },
		w = { "<cmd>wq<Cr>", "Save Quit" },
	},
	d = {
		name = 'Devtools',
		s = { "<cmd>PackerStatus<Cr>", "Packer Status" },
		S = { "<cmd>PackerSync<Cr>", "Packer Sync" },
		t = { "<cmd>StartupTime<Cr>", "StartupTime" },
	}
},
{ mode = 'n', prefix = "<leader>" })
