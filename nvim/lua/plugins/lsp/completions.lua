-- TODO: replace with mini.snippets
local luasnip = require 'luasnip'
luasnip.filetype_extend('typescript', { 'javascript' })
luasnip.filetype_extend('typescriptreact', { 'javascriptreact' })
require('luasnip.loaders.from_vscode').lazy_load()

luasnip.config.setup {
  region_check_events = 'CursorHold',
}

require('supermaven-nvim').setup {
  keymaps = {
    accept_suggestion = '<C-l>',
  },
}

require('blink.cmp').setup {
  keymap = {
    preset = 'enter',
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
  },
  completion = {
    menu = {
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local icon = ctx.kind_icon

              if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                icon = require('nvim-web-devicons').get_icon(ctx.label) or icon
              else
                icon = require('lspkind').symbolic(ctx.kind, {
                  mode = 'symbol',
                  preset = 'codicons',
                })
              end

              return icon .. ctx.icon_gap
            end,
          }
        }
      }
    }
  },
}
