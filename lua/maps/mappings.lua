
local wk = require 'which-key'
vim.g.mapleader = ' '


-- wk.register(mapping, opts)
wk.register({
  	f = {
    	name = "Telescope", -- optional group name
    	f = { "<cmd>Telescope find_files<cr>", "Find File" },
    	g = { "<cmd>Telescope live_grep<cr>", "Search Text" },
		c = { "<cmd>lua require 'telescope.builtin'.colorscheme{}<Cr>", "Change Colorscheme" },
		b = { "<cmd>Telescope buffers<Cr>", "Search Buffer" },
		h = { "<cmd>Telescope help_tags<Cr>", "Search Help Tags" },
  	},
  	p = {
	  	name = "Packer",
	  	s = { "<cmd>PackerStatus<Cr>", "Packer Status" },
		S = { "<cmd>PackerSync<Cr>", "Packer Sync" },
  	},
  	['<leader>'] = {
	  	name = "Special Operations",
	  	s = { "<cmd>so %<Cr>", "Source current File" },
		r = { "<cmd>call number_set#relative_numb()<Cr>", "Set Relativ Number" },
		n = { "<cmd>call number_set#normal_numb()<Cr>", "Set Number" },
		i = { "<cmd>IndentBlanklineToggle<Cr>", "Toggle Indent Line" },
  	},
	x = {
		name = 'Trouble',
		x = { '<cmd>TroubleToggle<Cr>', 'Toggle Trouble' },
		q = { '<cmd>TroubleToggle quickfix<Cr>', 'Quickfix' },
		d = { '<cmd>TroubleToggle document_diagnostics<Cr>', 'Doc Diagnostic'},
	},
	a = {
		name = 'Aerial',
		a = { '<cmd>AerialOpen<Cr>', 'Open Aerial' },
		t = { '<cmd>AerialToggle<Cr>', 'Toggle Aerial' },
	},
	q = {
		name = 'Quit',
		q = { "<cmd>q<Cr>", "Quit" },
		f = { "<cmd>q!<Cr>", "Unsaved Quit" },
		w = { "<cmd>wq<Cr>", "Save Quit" },
	},
	c = {
		name = 'Color/Cmd',
		c = { "<cmd>ColorizerToggle<Cr>", "Colorizer"},
		p = { "<cmd>Colortils picker<Cr>", "Picker" },
		l = { "<cmd>FineCmdline<Cr>", "FineLine" },
	},
	g = {
		name = 'Lsp',
		r = { "<cmd>Lspsaga rename<cr>", 'Rename' },
		x = { "<cmd>Lspsaga code_action<cr>", 'Code Action' },
		-- x = { ":<c-u>Lspsaga range_code_action<cr>", "Code Action" },
		o = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics" },
		j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
		k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" }
	},
	m = {
		name = 'Markdown',
		p = { "<cmd>MarkdownPreview<Cr>", "Preview" },
		s = { "<cmd>MarkdownPreviewStop<Cr>", "StopPreview" },
		t = { "<cmd>MarkdownPreviewToggle<Cr>", "Toggle Preview" }
	}


}, { mode = 'n', prefix = "<leader>" })

-- wk.register({
-- 	f = {
-- 		name = 'Folds',
-- 		o = { "<cmd>foldopen<Cr>", "Open Fold" },
-- 		c = { "<cmd>foldclose<Cr>", "Close Fold" },
--
-- 	}
-- })

wk.register({
	['<C-t>'] = { "<cmd>NvimTreeToggle<Cr>", "Toggle Nvim-Tree" },
	['<C-a>'] = { "<cmd>call run_file#Run_File()<Cr>", "Run File" },
	['<C-s>'] = { "<cmd>call save#w()<Cr>", "Save File" },
	-- ['<C-r>'] = { "<cmd>call number_set#relative_numb()<Cr>", "Set Relativ Number" },
	-- ['<C-e>'] = { "<cmd>call number_set#normal_numb()<Cr>", "Set Number" },
	-- ['<C-i>'] = { "<cmd>IndentBlanklineToggle<Cr>", "Toggle Indent Line" },
	['<C-h>'] = { "<cmd>WhichKey<Cr>", "Toggle WhichKey"},
	['<ESC>'] = { "<cmd>nohl<Cr>", "Remove Search Highlights" },
	['<C-l>'] = { "<cmd>q<Cr>", "Leave" },
	-- ['<leader>c'] = { "<cmd>FineCmdline<Cr>", "FineLine" },
	['<leader>t'] = { "<cmd>StartupTime<Cr>", "StartupTime" },
	['<C-e>'] = { "<cmd>ToggleTerm<Cr>", "ToggleTerm" },
	-- Q = {
	-- 	name = 'Quit',
	-- 	q = { "<cmd>q<Cr>", "Quit" },
	-- 	f = { "<cmd>q!<Cr>", "Unsaved Quit" },
	-- 	s = { "<cmd>wq<Cr>", "Save Quit" },
	-- },

}, { mode = 'n' })

-- wk.register({
-- 	jj = { "<ESC>", "ESC" },
-- }, { mode = 'i' })



wk.register({
	['<C-c>'] = { '"*y<Cr>', "Copy" },
}, { mode = 'v' })

local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)


