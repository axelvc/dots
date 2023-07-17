require('indent_blankline').setup {
  show_end_of_line = true,
  use_treesitter = true,
  show_current_context = true,
  show_trailing_blankline_indent = false,
  context_highlight_list = {
    'IndentBlanklineIndent1',
    'IndentBlanklineIndent2',
    'IndentBlanklineIndent3',
    'IndentBlanklineIndent4',
    'IndentBlanklineIndent5',
    'IndentBlanklineIndent6',
  },
  filetype_exclude = {
    'help',
    'terminal',
    'toggleterm',
    'NvimTree',
  },
  buftype_exclude = {
    'help',
    'nofile',
    'prompt',
  },
}
