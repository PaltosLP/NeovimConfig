--Personal Configs
require 'impatient'.enable_profile()

-----------------------------
--First Requirements
require 'core.opts'
require 'core.plugins'
require 'core.mappings'
-----------------------------



-----------------------------
--Customizations
vim.cmd.colorscheme("dracula")
vim.g.minimal_config = false
vim.g.user_interface = false
vim.g.transparent = false
-----------------------------



--further configs
require 'charon'
