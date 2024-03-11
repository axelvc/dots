local prettier = { 'prettierd', 'prettier' }
local js = { prettier }

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = js,
    typescript = js,
    javascriptreact = js,
    typescriptreact = js,
    css = { prettier },
    less = { prettier },
    scss = { prettier },
    html = { prettier },
    handlebars = { prettier },
    markdown = { prettier },
    svelte = { prettier },
    astro = { prettier },
    vue = { prettier },
    yaml = { prettier },
    json = { prettier },
    jsonc = { prettier },
  },
  formatters = {
    prettierd = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = os.getenv('MYVIMRC'):match '(.*/)' .. 'extra/.prettierrc.json',
      },
    },
    eslint_d = {
      require_cwd = true,
      cwd = require('conform.util').root_file{
        '.eslintrc',
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.mjs',
        '.eslintrc.json',
        '.eslintrc.yaml',
      },
    },
  },
})
