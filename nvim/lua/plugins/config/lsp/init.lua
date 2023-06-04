require 'plugins.config.lsp.diagnostic'

local lsp_util = require 'lspconfig.util'
local set_maps = require 'plugins.config.lsp.mapping'

local configs = {
  gopls = require 'plugins.config.lsp.languages.go',
  cssls = require 'plugins.config.lsp.languages.css',
  rust = require 'plugins.config.lsp.languages.rust',
  jsonls = require 'plugins.config.lsp.languages.json',
  emmet_ls = require 'plugins.config.lsp.languages.emmet'.setup,
  typescript = require 'plugins.config.lsp.languages.typescript',
}

lsp_util.default_config = vim.tbl_extend('force', lsp_util.default_config, {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = set_maps,
})

require('mason').setup {
  ui = { border = vim.g.border },
}

require('mason-lspconfig').setup {
  automatic_installation = true,
}

require('neodev').setup {
  library = {
    runtime = {
      version = 'LuaJIT',
    },
    workspace = {
      checkThirdParty = false,
    },
  },
}

require('mason-lspconfig').setup_handlers {
  function(server)
    require('lspconfig')[server].setup(configs[server] or {})
  end,
  ['tsserver'] = function()
    require('typescript').setup {
      server = vim.tbl_extend('force', lsp_util.default_config, configs.typescript),
    }
  end,
  ['rust_analyzer'] = function()
    configs.rust()
  end,
  ['rome'] = function() end
}
