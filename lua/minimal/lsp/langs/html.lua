local utils = require 'core.lsp.langs.utils'

local packer = require("packer")
packer.use({ 'windwp/nvim-ts-autotag',	ft = { 'html' }	})


local ls = require"luasnip"
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l




utils.capabilities.textDocument.completion.completionItem.snippetSupport = true



-- vim.cmd 'IndentBlanklineDisable'

require 'lspconfig'.html.setup {
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
	cmd = { "vscode-html-language-server", "--stdio" }
}


ls.add_snippets('html', {
	s('<div>', {
		t("<div>"), i(1, ""), t("</div>")

	})
})
