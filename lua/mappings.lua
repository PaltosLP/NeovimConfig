
vim.g.mapleader = ' '

vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  ':Telescope find_files<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-t>',
  ':NERDTreeToggle<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'i',
  'jj',
  '<ESC>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-a>',
  ':call run_file#Run_File()<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-s>',
  ':call save#w()<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-r>',
  ':call number_set#relative_numb()<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-n>',
  ':call number_set#normal_numb()<Cr>',
  { noremap = true, silent = true }
 )
