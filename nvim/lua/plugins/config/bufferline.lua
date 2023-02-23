local bufferline = require 'bufferline'

bufferline.setup {
  options = {
    tab_size = 20,
    max_name_length = 20,
    show_close_icon = false,
    show_tab_indicators = false,
    indicator = {
      icon = '⏽',
      style = 'icon',
    },
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, dict)
      if level == 'info' then
        return ''
      end

      return ('(%s)'):format(count - (dict.info or 0))
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
