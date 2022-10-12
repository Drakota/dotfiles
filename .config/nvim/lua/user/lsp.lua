local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "sumneko_lua", "tsserver", "jedi_language_server" },
  automatic_installation = true,
})

mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup({
      on_attach = mason.on_attach,
    })
  end
})

