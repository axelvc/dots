require('todo-comments').setup {
  keywords = {
    TODO = { icon = ' ', color = 'todo' },
    NOTE = { icon = '󰃮 ', color = 'note' },
    FIX  = { icon = ' ', color = 'error',   alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },

  },
  colors = {
    todo  = { '#cdb4db' },
    note  = { '#f9e2af' },
    error = { '#ff8fa3' },
    info  = { '#ffc8dd' },
  },
}
