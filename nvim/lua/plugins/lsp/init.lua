require 'plugins.lsp.diagnostic'

require('mason').setup()
require('mason-lspconfig').setup({
  automatic_enable = {
    exclude = { 'ts_ls' }
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local exclude_folding = Set:new { 'angularls', 'vue_ls' }
vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = function(server, buffer)
    -- disable folding
    if exclude_folding:has(server.name) then
      server.server_capabilities.foldingRangeProvider = false
    end

    _G.lsp_maps(buffer)
  end
})

vim.lsp.config('html', {
  filetypes = { 'html', 'css', 'javascript', 'htmlangular' },
})

vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.config('angularls', {
  workspace_required = true,
})
