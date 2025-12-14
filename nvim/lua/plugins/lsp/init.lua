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

vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = require 'plugins.lsp.maps'.init
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

vim.api.nvim_exec_autocmds('User', { pattern = 'LspSetup' })
