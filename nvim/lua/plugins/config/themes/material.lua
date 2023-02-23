local material = require 'material'

vim.g.material_style = 'deep ocean'

material.setup {
  contrast = {
    terminal = true,
    sidebars = true,
    floating_windows = true,
    cursor_line = true,
    non_current_windows = true,
    filetypes = {},
  },
  styles = {
    comments = { italic = true },
    functions = {},
    keywords = { italic = true },
    operators = {},
    strings = {},
    types = { italic = true },
    variables = {},
  },
  plugins = {
    'gitsigns',
    'indent-blankline',
    'nvim-cmp',
    'nvim-web-devicons',
    'telescope',
    'trouble',
    'which-key',
  },
}

vim.cmd 'colorscheme material'
