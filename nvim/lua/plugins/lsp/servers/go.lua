return {
  root_dir = function()
    return require('lspconfig').util.root_pattern '.git'() or vim.uv.cwd()
  end,
}
