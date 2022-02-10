local installer = require('nvim-lsp-installer')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, _)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
end

local configs = {
  ['cssls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
  ['eslint'] = {
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = true
      client.resolved_capabilities.document_range_formatting = true
      on_attach(client, bufnr)
    end,
  },
  ['html'] = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
  ['jsonls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
  ['sumneko_lua'] = {
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  ['tsserver'] = {
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  },
}

installer.on_server_ready(function(server)
  local opts = configs[server.name] or {}
  server:setup(opts)
end)
