local utils = require 'lsp.langs.utils'

local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l



require('lspconfig')['sumneko_lua'].setup {
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
	settings = {
	Lua = {
	   diagnostics = {
		  globals = { 'vim' }
		  }
	   }
	}
}

ls.add_snippets( "lua" , {
	s("print", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		t("print("), i(1, ""), t(")")
	})
})

