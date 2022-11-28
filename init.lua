--Personal Configs
require 'impatient'.enable_profile()


-----------------------------
--Customizations
vim.g.color_scheme = "dracula" --dracula, catppuccin
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
