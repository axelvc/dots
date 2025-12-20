require('render-markdown').setup {
  file_types = { 'markdown', 'mdx', 'Avante' },
  on = {
    attach = _G.markdown_maps,
  },
}

mapdata {
  '<leader>m', group = 'Markdown',
}
