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
      ['<M-p>'] = { 'toggle_preview', config = { uset_float = false, use_image_nvim = true } },
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
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
        added = 'A',
        deleted = 'D',
        modified = 'M',
        renamed = 'R',
        untracked = 'U',
        ignored = 'I',
        unstaged = 'M',
        staged = 'A',
        conflict = 'C',
      },
    },
    modified = {
      symbol = '●',
    },
  },
}

require('window-picker').setup {
  filter_rules = {
    include_current_win = false,
    autoselect_one = true,
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
      -- if the buffer type is one of following, the window will be ignored
      buftype = { 'terminal', 'quickfix' },
    },
  },
}
