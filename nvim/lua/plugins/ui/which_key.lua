require('which-key').setup {
  show_help = false,
  show_keys = false,
  layout = { align = 'center' },
  -- hidden = { '<silent>', '<cmd>', '<Cmd>', '<Plug>', '<CR>', 'call', 'lua', '^:', '^ ', '%(%)' },
  disable = {
    filetypes = { 'neo-tree', 'neo-tree-popup' },
  },
}
