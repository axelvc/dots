local plugins = require('lazy').stats().count

local padding = {
  type = 'padding',
  val = 2,
}

local padding_sm = {
  type = 'padding',
  val = 1,
}

local draw = {
  type = 'text',
  opts = {
    hl = 'Type',
    position = 'center',
  },
  val = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣷⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ⠀',
    '⠀⠀⠀⠀⠀⠀⠀⣀⣶⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣦⣀⡀⠀⢀⣴⣇⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀',
    '⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀',
    '⠀⠀⠀⣴⣿⣿⣿⣿⠛⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀',
    '⠀⠀⣾⣿⣿⣿⣿⣿⣶⣿⣯⣭⣬⣉⣽⣿⣿⣄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀',
    '⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄',
    '⢸⣿⣿⣿⣿⠟⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁⣿⣿⣿⣿⡿⠛⠉⠉⠉⠉⠁',
    '⠘⠛⠛⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠛⠃⠀    ',
  },
}

local date = {
  type = 'text',
  opts = {
    hl = 'Keyword',
    position = 'center',
  },
  val = {
    ' ' .. os.date '%A %d %B',
  },
}

--- @param txt string
--- @param keybind string
--- @param command string
local function button(txt, keybind, command)
  local opts = {
    position = 'center',
    shortcut = ('[%s]'):format(keybind:upper()),
    cursor = -2,
    width = 50,
    align_shortcut = 'right',
    hl_shortcut = 'Keyword',
  }

  local keybind_opts = { noremap = true, silent = true, nowait = true }
  opts.keymap = { 'n', keybind, command, keybind_opts }

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = 'group',
  opts = {
    spacing = 1,
  },
  val = {
    button('  New file',       'i', ':ene | startinsert<CR>'),
    button('  Find file',      'f', ':Telescope find_files<CR>'),
    button('  Find Word',      '/', ':Telescope grep_string<CR>'),
    button('  Settings',       '.', ':edit $MYVIMRC | cd %:p:h<CR>'),
    button('  Exit',           'q', ':quitall!<CR>'),
  },
}

local packages = {
  type = 'text',
  opts = {
    hl = 'Number',
    position = 'center',
  },
  val = {
    (' %s plugins loaded'):format(plugins)
  },
}

require('alpha').setup {
  layout = {
    padding,
    draw,
    padding,
    packages,
    padding_sm,
    buttons,
    date,
  },
  opts = {
    margin = 5,
  },
}
