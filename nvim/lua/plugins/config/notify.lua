require('notify').setup {
  stages = require 'notify.stages.static'(require('notify.stages.util').DIRECTION.BOTTOM_UP),
  timeout = 3000,
  background_colour = 'NormalFloat',
  icons = vim.g.signs,
}
