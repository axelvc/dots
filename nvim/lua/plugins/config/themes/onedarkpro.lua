require('onedarkpro').setup {
  options = {
    bold = true,
    italic = true,
    underline = true,
    undercurl = true,
    cursorline = false,
    transparency = false,
    terminal_colors = true,
    highlight_inactive_windows = true,
  },
  styles = {
    comments = 'italic',
    conditionals = 'italic',
    constants = 'bold,italic',
    functions = 'NONE',
    keywords = 'italic',
    numbers = 'NONE',
    operators = 'NONE',
    strings = 'NONE',
    types = 'italic',
    variables = 'NONE',
    virtual_text = 'NONE',
  },
  plugins = {
    gitsigns = true,
    indentline = true,
    nvim_notify = true,
    nvim_tree = true,
    nvim_ts_rainbow = true,
    telescope = true,
    toggleterm = true,
    treesitter = true,
    trouble = true,
    which_key = true,
  },
}

vim.cmd 'colorscheme onedark'
