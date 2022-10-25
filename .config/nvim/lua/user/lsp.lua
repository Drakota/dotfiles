local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local illuminate_status_ok, illuminate = pcall(require, "illuminate")
if not illuminate_status_ok then
  return
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "sumneko_lua", "tsserver", "jedi_language_server" },
  automatic_installation = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        illuminate.on_attach(client)
      end
    })
  end
})

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]]
