return {
  root_dir = function(fname)
    return require('lspconfig').util.root_pattern('.git', 'package.json', 'tsconfig.json', 'jsconfig.json')(fname)
      or vim.loop.cwd()
  end,
  init_options = {
    plugins = {
      {
        name = 'typescript-styled-plugin',
        location = vim.fn.expand '$NPM_HOME/.npm-global/lib',
      },
    },
  },
}
