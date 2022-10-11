local utils = require 'lang.langs.utils'

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

ls.add_snippets( "lua" , {
	s("print", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		t('print("'), i(1, ""), t('")')
	})
})


--------------------------------------------------------------------

ls.add_snippets('c', {
	s('HelloWorld', {
		t({'#include <stdio.h>','','int main() {','    printf("Hello World!");','    return 0;','}'})
	})
})

ls.add_snippets('c', {
	s('printf', {
		t('printf("'), i(1, ""), t('");')

	})
})

ls.add_snippets('c', {
	s('Alphabet_Low', {
		t("char low_alpha[] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};")

	})
})

ls.add_snippets('c', {
	s('Alphabet_Upper', {
		t("char upp_alpha[] = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};")

	})
})

--------------------------------------------------------------------

ls.add_snippets('python', {
	s('HelloWorld', {
		t("print('Hello World!')")
	})
})

ls.add_snippets( "python" , {
	s("print", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		t("print("), i(1, ""), t(")")
	})
})


--------------------------------------------------------------------

ls.add_snippets( "javascript" , {
	s("console.log", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		t('console.log("'), i(1, ""), t('")')
	})
})


