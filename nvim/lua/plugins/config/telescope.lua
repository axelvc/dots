local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    prompt_prefix = '   ',
    selection_caret = ' ',
    results_title = '',
    sorting_strategy = 'ascending',
    borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    file_ignore_patterns = { '%.git/', 'node_modules' },
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        width = 0.9,
        height = 0.9,
        preview_width = 0.6,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-.',
      '-g',
      '!{yarn.lock,package-lock.json,node_modules}',
    },
    mappings = {
      i = {
        ['<C-q>'] = actions.close,
        ['<C-s>'] = actions.select_vertical,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-b>'] = actions.preview_scrolling_up,
      },
      n = {
        ['q'] = actions.close,
        ['<C-q>'] = actions.close,
        ['<C-c>'] = actions.close,
        ['<C-s>'] = actions.select_vertical,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-b>'] = actions.preview_scrolling_up,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = {
        'rg',
        '--files',
        '--hidden',
        '--glob',
        '!**/.git/*',
      },
      path_display = function(_, path)
        local tail = require('telescope.utils').path_tail(path)
        local dir = path:match '(.*)/'

        if dir == nil then
          return tail
        end

        return ('%s %s'):format(tail, dir)
      end,
    },
  },
}

telescope.load_extension 'fzf'
telescope.load_extension 'noice'
telescope.load_extension 'notify'
