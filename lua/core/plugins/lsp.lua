local servers = { 'lua_ls', 'clangd', 'gopls', 'quick_lint_js', 'pyright', 'vimls', 'html' }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

vim.cmd([[hi LspInfoBorder guifg=white]])

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local configs = {}

for _, server in ipairs(servers) do
    configs[server] = {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

if configs.lua_ls then
    configs.lua_ls.settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
end

-- vim.lsp.config(configs)
for server_name, server_config in pairs(configs) do
    vim.lsp.config[server_name] = server_config
end
