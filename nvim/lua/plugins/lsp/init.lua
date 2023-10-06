local lsp_util = require 'lspconfig.util'

lsp_util.default_config = vim.tbl_extend('force', lsp_util.default_config, {
  capabilities = vim.tbl_extend('force', require('cmp_nvim_lsp').default_capabilities(), {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }),
  on_attach = require 'plugins.lsp.maps',
})

local CONFIG_PATH = 'plugins.lsp.servers.'
local configs = {
  gopls = require(CONFIG_PATH .. 'go'),
  cssls = require(CONFIG_PATH .. 'css'),
  rust = require(CONFIG_PATH .. 'rust'),
  jsonls = require(CONFIG_PATH .. 'json'),
  emmet_ls = require(CONFIG_PATH .. 'emmet').setup,
  typescript = require(CONFIG_PATH .. 'typescript'),
  angularls = require(CONFIG_PATH .. 'angular'),
}

require 'plugins.lsp.diagnostic'

require('mason').setup {
  ui = {
    border = vim.g.border,
  },
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
    local config = configs[server] or {}

    require('lspconfig')[server].setup(config)
  end,
  ['tsserver'] = function()
    local config = vim.tbl_extend('force', lsp_util.default_config, configs.typescript)

    require('typescript').setup {
      server = config,
    }
  end,
  ['rust_analyzer'] = function()
    configs.rust()
  end,
  ['rome'] = function() end,
}
