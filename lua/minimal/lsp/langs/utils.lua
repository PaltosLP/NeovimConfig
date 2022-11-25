local utils = {}

local opts = { noremap=true, silent=true }

if vim.g.minimal_config then
	utils.on_attach = (function(client, bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

	end)

else
	local packer = require("packer")
	packer.use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({})
		end,
	})

	utils.on_attach = function(client, bufnr)
		local wk = require("which-key")
		wk.register({
			g = {
				name = "LSP",
				d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
				D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration'},
				s = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Goto Type Definition' },
				r = { "<cmd>Lspsaga rename<cr>", "Rename" },
				x = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
				K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
				o = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostic" },
				j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
				k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" },
			}

		}, {prefix="<leader>", buffer=bufnr, silent=true, noremap=true })
		-- local map = vim.api.nvim_buf_set_keymap
		-- map(bufnr, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
		-- map(bufnr, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
		-- map(bufnr, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
		-- map(bufnr, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
		-- map(bufnr, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
		-- map(bufnr, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
		-- map(bufnr, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
		-- map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
		-- map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

	-- require("aerial").on_attach(client, bufnr)

end


end



-- utils.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- vim.api.nvim_set_keymap('n', '<S-e>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


return utils
