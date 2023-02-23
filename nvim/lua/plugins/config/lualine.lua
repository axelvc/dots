local o = vim.opt
local noice = require 'noice'
local command = vim.api.nvim_create_user_command

local short_mode = {
  'mode',
  fmt = function(str)
    local short_mode = str:sub(1, 1)

    for letter in str:gmatch '-%w' do
      short_mode = short_mode .. letter
    end

    return short_mode
  end,
}

require('lualine').setup {
  options = {
    section_separators = { left = '▙', right = '▟' },
    component_separators = { left = '⏽', right = '⏽' },
    padding = 2,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      short_mode,
    },
    lualine_b = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        always_visible = false,
        symbols = vim.g.signs,
      },
    },
    lualine_c = {
      {
        'branch',
        icon = '',
        separator = '',
        padding = { left = 2, right = 0 },
      },
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
        separator = '',
        padding = { left = 2, right = 0 },
      },
    },
    lualine_x = {
      {
        noice.api.status.mode.get,
        cond = function()
          return noice.api.status.mode.has() and noice.api.status.mode.get():match 'recording' ~= nil
        end,
        fmt = function(str)
          return str:match '(recording @.*)'
        end,
        color = 'Recording',
      },
      {
        'encoding',
        cond = function()
          return o.fileencoding:get() ~= 'utf-8'
        end,
      },
      {
        'fileformat',
        cond = function()
          return o.fileformat:get() ~= 'unix'
        end,
      },
      {
        function()
          return o.filetype:get()
        end,
      },
    },
    lualine_y = {
      {
        function()
          return os.date '%H:%M'
        end,
        cond = function()
          return vim.g.clock
        end,
        separtor = '-',
        color = 'Clock',
      },
      '%l:%c',
    },
    lualine_z = {
      {
        'Lines: %L',
        type = 'stl',
      },
    },
  },
  extensions = {
    {
      filetypes = { 'alpha' },
      sections = {
        lualine_a = {
          short_mode,
        },
        lualine_z = {
          {
            'Alpha',
            type = 'stl',
          },
        },
      },
    },
  },
}

command('Clock', function()
  vim.g.clock = not vim.g.clock
end, {})
