require('nvim-surround').setup {
  move_cursor = false,
  aliases = {
    ['a'] = '>',
    ['p'] = ')',
    ['b'] = ']',
    ['k'] = '}',
    ['q'] = { '"', "'", '`' },
    ['s'] = { '}', ']', ')', '>', '"', "'", '`' },
  },
}
