require 'plugins.config.lsp.diagnostic'

local lsp_util = require 'lspconfig.util'
local set_maps = require 'plugins.config.lsp.mapping'

local configs = {
  cssls = require 'plugins.config.lsp.languages.css',
  jsonls = require 'plugins.config.lsp.languages.json',
  gopls = require 'plugins.config.lsp.languages.go',
  emmet_ls = require 'plugins.config.lsp.languages.emmet',
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
    local rt = require 'rust-tools'

    rt.setup {
      server = {
        on_attach = function()
          set_maps()

          -- inlay hints
          map('n', '<leader>hs', rt.inlay_hints.set, { buffer = true, desc = 'Set' })
          map('n', '<leader>hs', rt.inlay_hints.unset, { buffer = true, desc = 'Unset' })
          map('n', '<leader>he', rt.inlay_hints.enable, { buffer = true, desc = 'Enable' })
          map('n', '<leader>hd', rt.inlay_hints.disable, { buffer = true, desc = 'Disable' })

          -- runnables
          map('n', '<leader>r', rt.runnables.runnables, { buffer = true, desc = 'Runables' })

          local exists, wk = pcall(require, 'which-key')
          if exists then
            wk.register({
              ['<leader>h'] = { name = 'Hints' },
            }, { buffer = bufnr })
          end
        end,
      },
    }
  end,
}
