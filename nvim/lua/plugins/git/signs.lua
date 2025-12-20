require('gitsigns').setup {
  current_line_blame_opts = {
    delay = 100,
  },
  on_attach = _G.git_maps,
}
