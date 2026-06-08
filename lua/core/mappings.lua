--Neovim Docs
--{lhs}	means left-hand-side
--{rhs}	means right-hand-side
--Wrapper for keymaps
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set({"n", "v"}, "<C-v>", '"+p')
vim.keymap.set({"i", "c"}, "<C-v>", "<C-r>+")

--clear search highlights
map('n', '<ESC>', ':nohl<CR>')

--basics
map('n', '<C-a>', '<cmd>call run_file#Run_File()<Cr>')
map('n', '<C-s>', '<cmd>call save#w()<Cr>')
map('n', '<C-l>', '<cmd>q<Cr>')
--map('v', '<C-c>', '"*y<Cr>') --more info in opt (needs win32yank-wsl.exe in path)
map('n', '<C-p>', '<cmd>call save#pwd()<Cr>')

map('n', '<C-b>', '<cmd>call battery#is_charging()<Cr>')

local keymap = vim.keymap.set

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")




vim.api.nvim_set_keymap("n", "<leader>?", "<cmd>WhichKey<CR>", {})
vim.api.nvim_set_keymap('n', '<C-t>', "<cmd>NvimTreeToggle<Cr>", {})

local wk = require("which-key")

wk.add({
    { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Outline", mode = "n" },

    { "<leader>q", group = "Quit", mode = "n" },
    { "<leader>qq", "<cmd>q<Cr>", desc = "Quit", mode = "n" },
    { "<leader>qf", "<cmd>q!<Cr>", desc = "Unsaved Quit", mode = "n" },
    { "<leader>qw", "<cmd>wq<Cr>", desc = "Save Quit", mode = "n" },

    { "<leader>d", group = "Devtools", mode = "n" },
    { "<leader>ds", "<cmd>Lazy home<Cr>", desc = "Lazy Home", mode = "n" },
    { "<leader>dt", "<cmd>StartupTime<Cr>", desc = "StartupTime", mode = "n" },

    { "<leader>f", group = "Telescope", mode = "n" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search Text", mode = "n" },
    { "<leader>fc", "<cmd>lua require 'telescope.builtin'.colorscheme{}<Cr>", desc = "Change Colorscheme", mode = "n" },
    { "<leader>fv", "<cmd>lua require 'telescope.builtin'.commands{}<Cr>", desc = "List Commands", mode = "n" },
    { "<leader>ft", "<cmd>lua require 'telescope.builtin'.treesitter{}<Cr>", desc = "List File from Treesitter", mode = "n" },
    { "<leader>fp", "<cmd>lua require 'telescope.builtin'.planets{}<Cr>", desc = "Planets", mode = "n" },
    { "<leader>fb", "<cmd>Telescope buffers<Cr>", desc = "Search Buffer", mode = "n" },
    { "<leader>fh", "<cmd>Telescope help_tags<Cr>", desc = "Search Help Tags", mode = "n" },
    { "<leader>fj", "<cmd>Telescope highlights<Cr>", desc = "Search Highlights", mode = "n" },

    { "<leader>r", group = "Random", mode = "n" },
    { "<leader>rr", ":CellularAutomaton make_it_rain<Cr>", desc = "It's rainin", mode = "n" },
    { "<leader>rg", ":CellularAutomaton game_of_life<Cr>", desc = "Game of Life", mode = "n" },
    { "<leader>rd", "<cmd>lua require('duck').hatch()<Cr>", desc = "Duck hatch", mode = "n" },
    { "<leader>rf", "<cmd>lua require('duck').cook()<Cr>", desc = "Duck cook", mode = "n" },

    { "<leader>t", group = "Tools", mode = "n" },
    { "<leader>tc", ":Colortils", desc = "Colortils", mode = "n" },
    { "<leader>tt", "<cmd>ToggleTerm<Cr>", desc = "ToggleTerm", mode = "n" },

    { "<leader>g", group = "LSP", mode = "n" },
    { "<leader>gr", "<cmd>Lspsaga rename<CR>", desc = "Rename", mode = "n" },
    { "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Help", mode = "n" },
    { "<leader>ga", "<cmd>Lspsaga code_action<CR>", desc = "Action", mode = "n" },
    { "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Definition", mode = "n" },
    { "<leader>gt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Type Def", mode = "n" },
    { "<leader>go", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostic", mode = "n" },
    { "<leader>gb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Buffer Diagnostic", mode = "n" },
    { "<leader>ge", "<cmd>Lspsaga term_toggle<CR>", desc = "Terminal", mode = "n" },

    { "<leader>b", group = "Buffer", mode = "n" },
    { "<leader>bq", "<cmd>buffer 1<Cr>", desc = "To Buf 1", mode = "n" },
    { "<leader>bw", "<cmd>buffer 2<Cr>", desc = "To Buf 2", mode = "n" },
    { "<leader>be", "<cmd>buffer 3<Cr>", desc = "To Buf 3", mode = "n" },
})
