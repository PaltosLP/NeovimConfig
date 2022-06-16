local utils = require 'lang.langs.utils'

-- local ls = require"luasnip"
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node


require('lspconfig')['sumneko_lua'].setup{
	on_attach = utils.on_attach,
	--capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	settings = {
		Lua = {
	   		diagnostics = {
		  		globals = { 'vim' }
		  	}
	   	}
	}
}


-- ls.add_snippets( "lua" , {
-- 	s("print", {
-- 		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
-- 		t("print("), i(1, ""), t(")")
-- 	})
-- })


