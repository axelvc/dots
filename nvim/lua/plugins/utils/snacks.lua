---require('snacks')
---@type snacks.Config
return {
  zen = {
    toggles = {
      dim = false
    }
  },
  bufdelete = {
    enabled = true,
  },
  indent = {
    enabled = true,
    animate = {
      enabled = false,
    },
  },
  input = {
    enabled = true,
  },
  words = {
    enabled = true,
    debounce = 100,
  },
  statuscolumn = {
    enabled = true,
    folds = {
      open = true,
      git_hl = true,
    }
  },
  notifier = {
    enabled = true,
    icons = {
      error = vim.g.signs.error,
      warn = vim.g.signs.warn,
      info = vim.g.signs.info,
      debug = vim.g.signs.debug,
      trace = vim.g.signs.trace,
    },
    top_down = false,
  },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = ' ', desc = 'New File', key = 'i', action = ':ene | startinsert' },
        { icon = ' ', desc = 'Config', key = '.', action = ':edit $MYVIMRC | cd %:p:h' },
        { icon = ' ', desc = 'Exit', key = 'q', action = ':quitall!' },
      },
      header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣷⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣶⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣦⣀⡀⠀⢀⣴⣇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣿⣿⣿⠛⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀
⠀⠀⣾⣿⣿⣿⣿⣿⣶⣿⣯⣭⣬⣉⣽⣿⣿⣄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀
⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄
⢸⣿⣿⣿⣿⠟⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁⣿⣿⣿⣿⡿⠛⠉⠉⠉⠉⠁
⠘⠛⠛⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠛⠃⠀
        ]],
    }
  },
  picker = {
    enabled = true,
    prompt = '  ',
    exclude = {
      'node_modules',
    },
    formatters = {
      file = {
        filename_first = true,
      }
    }
  },
}
