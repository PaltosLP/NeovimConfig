local status = pcall(require, 'cmp' )
if not status then
    print('comp Error')
    return
end



local cmp = require 'cmp'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

local signs = { Error = "", Warn = "", Info = "כֿ", Hint = "" }
for sign, icon in pairs(signs) do
	vim.fn.sign_define(
		"DiagnosticSign" .. sign,
		{ text = icon, texthl = "Diagnostic" .. sign, linehl = false, numhl = "Diagnostic" .. sign }
	)
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	-- Function = "GG",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = ""
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
	  -- documentation = cmp.config.window.bordered(),
		documentation = {
   			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  		},
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
			-- { name = 'nvim_lsp' },
			{ name = 'luasnip' }, -- For luasnip users.
			-- { name = 'look' },
			{ name = 'buffer' },
			{ name = 'path' },
		}
	),
	formatting = {
		fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
		format = function(entry, vim_item)
		-- Kind icons
		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		vim_item.menu = ({
			luasnip = "[Snippet]",
			buffer = "[Buffer]",
			path = "[Path]",
		})[entry.source.name]
			return vim_item
		end,
		maxwidth = 50,
  			},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
 		},
  	experimental = {
		ghost_text = false,
		native_menu = false,
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
	}
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
