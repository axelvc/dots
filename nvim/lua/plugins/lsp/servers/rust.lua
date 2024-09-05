return function()
  local rt = require 'rust-tools'
  local set_maps = require 'plugins.lsp.maps'

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
          wk.add {
            { '<leader>h', group = 'Hints' },
          }
        end
      end,
      settings = {
        ['rust-analyzer'] = {
          checkOnSave = {
            allFeatures = true,
            overrideCommand = {
              'cargo',
              'clippy',
              '--workspace',
              '--message-format=json',
              '--all-targets',
              '--all-features',
              -- '--',
              -- '-W',
              -- 'clippy::pedantic',
            },
          },
        },
      },
    },
  }
end
