require('trouble').setup {
  action_keys = {
    previous = { 'k', '<C-k>' },
    next = { 'j', '<C-j>' },
  },
  padding = false,
  auto_close = true,
  use_diagnostic_signs = true,
}
