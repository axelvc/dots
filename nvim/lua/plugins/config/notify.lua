local notify = require 'notify'
local stages_util = require 'notify.stages.util'

notify.setup {
  stages = require 'notify.stages.static'(stages_util.DIRECTION.BOTTOM_UP),
  timeout = 3000,
  background_colour = 'NormalFloat',
  icons = vim.g.signs,
}
