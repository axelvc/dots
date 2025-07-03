require 'plugins.lsp.diagnostic'

require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
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

require('typescript-tools').setup {
  expose_as_code_action = 'all',
  complete_function_calls = true,
}

vim.api.nvim_exec_autocmds('User', { pattern = 'LspSetup' })
