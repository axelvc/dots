require('notify').setup {
  stages = require 'notify.stages.static' (require('notify.stages.util').DIRECTION.BOTTOM_UP),
  timeout = 3000,
  background_colour = 'NormalFloat',
  icons = {
    ERROR = vim.g.signs.error,
    DEBUG = vim.g.signs.debug,
    INFO  = vim.g.signs.info,
    TRACE = vim.g.signs.info,
    WARN  = vim.g.signs.warn,
    HINT  = vim.g.signs.hint,
  },
}
