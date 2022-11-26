

local packer = require('packer')
packer.use({ "Mofiqul/vscode.nvim", as = "vscode" }) --, opt=true
packer.use({ "catppuccin/nvim", as = "catppuccin" })
packer.use({ 'joshdick/onedark.vim', as = "onedark" })
-- packer.use({ 'morhetz/gruvbox', cmd = { 'colorscheme' } })
-- packer.use({ 'marko-cerovac/material.nvim', cmd = { 'colorscheme' } })
-- packer.use({ 'shaunsingh/nord.nvim', cmd = { 'colorscheme' } })
-- packer.use({ 'NLKNguyen/papercolor-theme', cmd = { 'colorscheme' } })
-- packer.use({ 'ghifarit53/tokyonight-vim', cmd = { 'colorscheme' }})
-- packer.use({ 'sainnhe/everforest', cmd = { 'colorscheme' } })
-- packer.use({ 'rmehri01/onenord.nvim', cmd = { 'colorscheme' } })


-- if not (vim.g.color_scheme == 'catppuccin') then
-- 	local cmd_packerload = 'PackerLoad ' .. vim.g.color_scheme .. '.nvim'
-- 	vim.cmd(cmd_packerload)
-- end

vim.cmd.colorscheme(vim.g.color_scheme)

require("core.highlights.treesitter")
require("core.highlights.custom")
