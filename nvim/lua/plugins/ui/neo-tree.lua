require('neo-tree').setup {
  close_if_last_window = true,
  hide_root_node = true,
  log_level = 'error',
  popup_border_style = vim.g.border,
  window = {
    auto_expand_width = true,
    position = 'right',
    width = 45,
    mappings = {
      ['o'] = 'open',
    },
  },
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    {
      event = 'file_opened',
      handler = function() --auto close
        require('neo-tree').close_all()
      end,
    },
  },
  default_component_configs = {
    icon = {
      folder_closed = ' ',
      folder_open = ' ',
      folder_empty = ' ',
      default = '',
    },
    git_status = {
      symbols = {
        deleted = 'D',
        modified = 'M',
        renamed = 'R',
        untracked = 'U',
        ignored = 'I',
        unstaged = 'M',
        staged = 'A',
        conflict = '!',
      },
    },
    modified = {
      symbol = '●'
    },
  },
}
