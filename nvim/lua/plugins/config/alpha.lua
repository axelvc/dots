---@param val number
local function padding(val)
  return {
    type = 'padding',
    val = val,
  }
end

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

require('alpha').setup {
  layout = {
    padding(2),
    {
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
    },
    padding(2),
    {
      type = 'text',
      opts = {
        hl = 'Number',
        position = 'center',
      },
      val = {
        ('󰏗 %s plugins loaded'):format(require('lazy').stats().count),
      },
    },
    padding(1),
    {
      type = 'group',
      opts = {
        spacing = 1,
      },
      val = {
        button('  New file', 'i', ':ene | startinsert<CR>'),
        button('  Find file', 'f', ':Telescope find_files<CR>'),
        button('󰈭  Find Word', '/', ':Telescope grep_string<CR>'),
        button('  Settings', '.', ':edit $MYVIMRC | cd %:p:h<CR>'),
        button('  Exit', 'q', ':quitall!<CR>'),
      },
    },
    {
      type = 'text',
      opts = {
        hl = 'Keyword',
        position = 'center',
      },
      val = {
        ' ' .. os.date '%A %d %B',
      },
    },
  },
}
