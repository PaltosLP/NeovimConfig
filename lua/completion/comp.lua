-- local status = pcall(require, 'cmp' )
-- if not status then
--     print('comp Error')
--     return
-- end



local cmp = require 'cmp'
-- local lspkind = require 'lspkind'
local luasnip = require 'luasnip'
luasnip.config.set_config({
	history = true,
	updateevents = 'TextChanged, TextChangedI',
	enable_autosnippets = true,
	-- region_check_events = 'InserEnter',
	delete_check_events = 'InsertLeave'
})


-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
--
--
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
-- -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"


local signs = { Error = "", Warn = "", Info = "כֿ", Hint = "" }
for sign, icon in pairs(signs) do
	vim.fn.sign_define(
		"DiagnosticSign" .. sign,
		{ text = icon, texthl = "Diagnostic" .. sign, numhl = "Diagnostic" .. sign }
	)
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


local kind_icons = {
	Text = "   ",
	Method = "   ",
	Function = "   ",
	-- Function = "GG",
	Constructor = "   ",
	Field = " ﰠ   ",
	Variable = "   ",
	Class = " ﴯ  ",
	Interface = "   ",
	Module = "   ",
	Property = " ﰠ  ",
	Unit = " 塞 ",
	Value = "   ",
	Enum = "   ",
	Keyword = "   ",
	Snippet = "   ",
	Color = "   ",
	File = "   ",
	Reference = "   ",
	Folder = "   ",
	EnumMember = "   ",
	Constant = "   ",
	Struct = " פּ  ",
	Event = "   ",
	Operator = "   ",
	TypeParameter = "    "
	}
-- find more here: https://www.nerdfonts.com/cheat-sheet



cmp.setup({
	snippet = {
	  expand = function(args)
		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	  end,
		},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
   		-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		-- documentation = { border = "rounded", scrollbar = "║" },
		-- completion = { border = "rounded", scrollbar = "║" },
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,

		}
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
	    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-e>"] = cmp.mapping {
     		i = cmp.mapping.abort(),
      		c = cmp.mapping.close(),
			},
        ["<cr>"] = cmp.mapping.confirm { select = true },
		["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, { "i", "s" }
			),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s"	}
			),
	},



	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }, -- For luasnip users.
			-- { name = 'look' },
			{ name = 'buffer' },
			{ name = 'path' },
		}
	),
	formatting = {
		fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
		-- fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr },
		format = function(entry, vim_item)
		-- Kind icons
		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		vim_item.menu = ({
			luasnip = "[Snippet]",
			buffer = "[Buffer]",
			path = "[Path]",
		    nvim_lsp = "[LSP]",
		    nvim_lua = "[Lua]",
		    latex_symbols = "[Latex]",
		})[entry.source.name]
			return vim_item
		end,

		maxwidth = 40,
  			},


	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
 		},
  	experimental = {
		ghost_text = false,
		native_menu = false,
  		},
		view = {
 			entries = {name = 'custom', selection_order = 'near_cursor' }
		},
})

	-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	},
{
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	},
	view = {
    entries = {name = 'wildmenu', separator = ' | ' }
  },
})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
		},
	{
	  { name = 'cmdline' }
	})
})

--vscode like 
vim.cmd([[ 
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])



--menu
local highl = {
  -- PmenuSel = { bg = "#282C34" },
  PmenuSel = { bg = "#FFFFFF", fg = "NONE" },
  -- Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
  Pmenu = { fg = "#C5CDD9", bg = "NONE" },

  -- CmpItemAbbrDeprecated = { fg = "#7E8294", strikethrough=true},
  CmpItemAbbrDeprecated = { fg = "#FFFFFF", strikethrough=true},
  CmpItemAbbrMatch = { fg = "#82AAFF", bold=true },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF",  bold=true },
  CmpItemMenu = { fg = "#C792EA",italic=true },

  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

  CmpItemKindText = { fg = "#DEF2C1", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#DEF2C1", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#DEF2C1", bg = "#9FBD73" },

  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
}

for hl_name, hl_table in pairs(highl) do
	vim.api.nvim_set_hl(0,hl_name,hl_table)
end
