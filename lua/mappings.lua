
vim.g.mapleader = ' '

vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  ':Telescope find_files()<cr>',
  { noremap = true }
 )
