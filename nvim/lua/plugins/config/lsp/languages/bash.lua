return {
  filetypes = { 'sh', 'bash', 'zsh' },
  root_dir = function()
    return require('lspconfig').util.find_git_ancestor() or vim.loop.cwd()
  end,
}
