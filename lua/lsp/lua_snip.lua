
---------------------------------------------------------------
--  __                       ____
-- /\ \                     /\  _`\           __
-- \ \ \      __  __     __ \ \,\L\_\    ___ /\_\  _____
--  \ \ \  __/\ \/\ \  /'__`\\/_\__ \  /' _ `\/\ \/\ '__`\
--   \ \ \L\ \ \ \_\ \/\ \L\.\_/\ \L\ \/\ \/\ \ \ \ \ \L\ \
--    \ \____/\ \____/\ \__/.\_\ `\____\ \_\ \_\ \_\ \ ,__/
--     \/___/  \/___/  \/__/\/_/\/_____/\/_/\/_/\/_/\ \ \/
--                                                   \ \_\
--                                                    \/_/
---------------------------------------------------------------

local ls = require 'luasnip'

ls.config.set_config {
	history = true,
	updateevents = 'TextChanged, TextChangedI',
	enable_autosnippets = true
}


-- <C-k> expands the snippet and jumps inside the the snippet
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
	if ls.expand_or_jumpable() then
   		ls.expand_or_jump()
  	end
end, { silent = true })

-- <C-j> jumps back inside the snippet
vim.keymap.set({ 'i', 's' }, '<C-j>', function()
   	if ls.jumpable(-1) then
   	   ls.jump(-1)
   	end
end, { silent = true })
