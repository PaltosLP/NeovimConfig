


require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    --show_current_context = true,
    -- show_current_context_start = true,

	char = "▏",
    use_treesitter = true,
    --show_first_indent_level = false,
	filetype_exclude = {
		'help',
		'dashboard',
		'git',
		'markdown',
		'text',
		'terminal',
		'lspinfo',
		'packer',
		'NvimTree',
  }
}
