local biome = { 'biome', 'biome-check', 'biome-organize-imports' }
local prettier = { 'prettierd', 'prettier', stop_after_first = true }
local format = biome
local js = biome

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = js,
    typescript = js,
    javascriptreact = js,
    typescriptreact = js,
    css = format,
    less = format,
    scss = format,
    html = format,
    htmlangular = format,
    handlebars = format,
    markdown = format,
    svelte = format,
    astro = format,
    vue = format,
    yaml = format,
    json = format,
    jsonc = format,
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
