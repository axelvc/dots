local wk = require 'which-key'

wk.setup {
  show_help = false,
  show_keys = false,
  layout = { align = 'center' },
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<Plug>', '<CR>', 'call', 'lua', '^:', '^ ', '%(%)' },
  disable = {
    filetypes = { 'neo-tree', 'neo-tree-popup' },
  },
}

wk.register {
  ['<Leader>b'] = { name = 'Buffer' },
  ['<Leader>j'] = { name = 'Join utils' },
}
