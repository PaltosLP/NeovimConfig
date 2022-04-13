


require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    -- show_current_context_start = true,
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
