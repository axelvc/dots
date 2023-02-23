local command = vim.api.nvim_create_user_command

-- trailspace
local trailspace = require 'mini.trailspace'
trailspace.setup {}
command('Whitespace', trailspace.trim, {})

-- move
require('mini.move').setup {}
