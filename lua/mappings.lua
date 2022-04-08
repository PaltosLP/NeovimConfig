
vim.g.mapleader = ' '

vim.api.nvim_set_keymap(
  'n',
  '<leader>f',
  '<cmd>Telescope find_files<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-t>',
  '<cmd>NERDTreeToggle<Cr>',
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
  '<cmd>call run_file#Run_File()<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-s>',
  '<cmd>call save#w()<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-r>',
  '<cmd>call number_set#relative_numb()<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<C-n>',
  '<cmd>call number_set#normal_numb()<Cr>',
  { noremap = true, silent = true }
 )

vim.api.nvim_set_keymap(
  'n',
  '<leader>ps',
  '<cmd>PackerStatus<Cr>',
  { noremap = true, silent = true }
 )
