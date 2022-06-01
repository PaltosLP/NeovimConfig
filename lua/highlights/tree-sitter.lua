local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
	return "treesitter Error"
end


configs.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"python", "vim", "lua","c","norg", "css", "html", "javascript", "json","go" ,"markdown" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
 --    colors = {
	-- 	"#FF0000", --pink
	-- 	"#FF00FF", --yellow
	-- 	"#FFFF00", --purple
	-- 	"#6600FF",
	-- 	"#0000FF",
	-- }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {
	filetypes = { "html" },
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

vim.cmd 'hi! link TSKeywordOperator Keyword'

require("nvim-treesitter.highlight").set_custom_captures({
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    -- ["foo.bar"] = "Identifier",
    ["require_call"] = "RequireCall",
    ["function_definition"] = "FunctionDefinition",
    ["quantifier"] = "Special",
    ["field"] = "htmlArg",
})


require("nvim-treesitter.highlight").set_custom_captures({
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    -- ["foo.bar"] = "Identifier",
    ["require_call"] = "RequireCall",
    ["function_definition"] = "FunctionDefinition",
    ["quantifier"] = "Special",
    ["variable"] = "TSField",
})

-- vim.highlight.create('NormalFloat', {ctermbg=0, guibg=none}, false)
vim.cmd[[highlight NormalFloat ctermbg=0 guibg=none]]
vim.cmd[[highlight FloatBorder ctermbg=0 guibg=none]]


-- cmds:
-- :TSPLayground
-- <C-w-l>
-- hover over object
-- TSHighlightCaptureUnderCursor
-- :Telescope Highlights


