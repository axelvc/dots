require('neo-tree').setup {
  close_if_last_window = true,
  enable_modified_markers = false, -- Show markers for files with unsaved changes.
  hide_root_node = true,
  log_level = 'error',
  popup_border_style = vim.g.border,
  sources = { 'filesystem' },
  source_selector = {
    statusline = true, -- toggle to show selector on statusline
    winbar = true, -- toggle to show selector on winbar
    tab_labels = { -- falls back to source_name if nil
      filesystem = '  ',
      buffers = '  ',
      git_status = '  ',
    },
    content_layout = 'center',
    separator = '⏽', -- can be string or table, see below
    separator_active = '⏽', -- set separators around the active tab. nil falls back to `source_selector.separator`
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
  },
  window = {
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
}
