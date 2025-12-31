local prettier = { 'prettierd', 'prettier', stop_after_first = true }
local js = { 'prettierd', 'eslint_d' }

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = js,
    typescript = js,
    javascriptreact = js,
    typescriptreact = js,
    css = prettier,
    less = prettier,
    scss = prettier,
    html = prettier,
    htmlangular = prettier,
    handlebars = prettier,
    markdown = prettier,
    svelte = prettier,
    astro = prettier,
    vue = prettier,
    yaml = prettier,
    json = prettier,
    jsonc = prettier,
    python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
  },
  formatters = {
    prettierd = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = os.getenv('MYVIMRC'):match '(.*/)' .. 'extra/.prettierrc.json',
      },
    },
    eslint_d = {
      require_cwd = true,
      cwd = require('conform.util').root_file {
        '.eslintrc',
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.mjs',
        '.eslintrc.json',
        '.eslintrc.yaml',
      },
    },
  },
}
