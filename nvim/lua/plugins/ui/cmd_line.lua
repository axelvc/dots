require('noice').setup {
  cmdline = {
    view = 'cmdline_popup',
    format = {
      search_down = { icon = ' ' },
      search_up = { icon = ' ' },
      input = {
        icon = '',
        opts = {
          prompt = '',
          text = {
            top = 'Rename',
          },
        },
      },
      replace = {
        pattern = "^:('<,'>)%%?s/",
        icon = ' ',
        ft = 'regex',
        opts = {
          border = {
            text = {
              top = ' Replace ',
            },
          },
        },
      },
      replace_selection = {
        pattern = "^:('<,'>)%%?s/",
        icon = ' ',
        ft = 'regex',
        opts = {
          border = {
            text = {
              top = ' Replace Selection',
            },
          },
        },
      },
    },
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  routes = {
    -- hide undo/redo messages
    { filter = { event = 'msg_show', find = 'Already at %w+ change' },         mode = 'mini' },
    { filter = { event = 'msg_show', find = '; %w+ #%d+' },                    skip = true },
    { filter = { event = 'msg_show', find = 'clipboard' },                     mode = 'mini' },
    { filter = { event = 'notify', find = 'No information available' },        skip = true },
    -- hide search message
    { filter = { event = 'msg_show', kind = 'wmsg', find = 'search hit %w+' }, skip = true },
    -- mini written message
    { filter = { event = 'msg_show', find = 'written' },                       view = 'mini' },
  },
  presets = {
    command_palette = false,
    lsp_doc_border = true,
  },
}
