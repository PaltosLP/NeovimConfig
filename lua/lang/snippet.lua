local status = pcall(require, 'cmp')
if not status then
   print('cmp Error')
   return
end

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

ls.config.set_config({
	history = true,
	updateevents = 'TextChanged, TextChangedI',
	enable_autosnippets = true
})

require("luasnip/loaders/from_vscode").load({
	paths = {
		"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
	},
})


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

-- <C-l> switches between a list of options
vim.keymap.set( 'i', '<C-l>', function ()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})


-- local date = function() return {os.date('%Y-%m-%d')} end
--
-- ls.add_snippets('all', {
-- 	ls.snippet{
-- 		trig = "date",
-- 		namr = "Datess",
-- 		dscr = "Date in the form of YYYY-MM-DD"
-- 	}
--
-- })

-- ls.snippet({trig="trigger", name='trigg'}, {})

-- ls.add_snippets( "lua" , {
-- 	s("print", {
-- 		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
-- 		t("print("), i(1, ""), t(")")
-- 	})
-- })
--
-- ls.add_snippets('python', {
--     s('HelloWorld', {
--   		t("print('Hello World!')")
--    })
-- })
