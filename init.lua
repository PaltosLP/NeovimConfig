--Personal Configs
require 'impatient'.enable_profile()

--MapLeader set to Space
vim.g.mapleader = ' '

-----------------------------
--Customizations
vim.g.color_scheme = 'dracula' --dracula, catppuccin, vscode, darcula
vim.g.minimal_config = false
vim.g.user_interface = false
vim.g.transparent = false
-----------------------------


-----------------------------
--First Requirements
require 'core.opts'
require 'core.plugins'
require 'core.mappings'
-----------------------------


--further configs
require 'charon'
