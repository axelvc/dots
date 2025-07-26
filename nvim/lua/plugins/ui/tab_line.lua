require('bufferline').setup {
  options = {
    tab_size = 20,
    max_name_length = 40,
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_tab_indicators = false,
    indicator = {
      style = 'none',
    },
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, dict)
      if level == 'info' or level == 'hint' then
        return ''
      end

      return ('(%s)'):format(count - (dict.info or 0) - (dict.hint or 0))
    end,
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        text_align = 'center',
      },
    },
  },
}
