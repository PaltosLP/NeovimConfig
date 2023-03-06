--Personal Configs

--MapLeader set to Space
vim.g.mapleader = ' '
-- vim.opt.runtimepath:append('~/.local/share/nvim/mason/bin') --> via fish / shell

-----------------------------
--Customizations
vim.g.color_scheme = 'onedark' --dracula, catppuccin, vscode, darcula
vim.g.minimal_config = false
vim.g.user_interface = false
vim.g.transparent = false
-----------------------------


-----------------------------
--Core Requirements
require 'core.opts'
require 'core.plugins'
require 'core.mappings'
-----------------------------


--further configs
require 'charon'
