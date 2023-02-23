return {
  env = {
    PRETTIERD_DEFAULT_CONFIG = os.getenv('MYVIMRC'):match '(.*/)' .. '.prettierrc.json',
  },
  filetypes = {
    'astro',
    'css',
    'graphql',
    'handlebars',
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'jsonc',
    'less',
    'markdown',
    'scss',
    'svelte',
    'typescript',
    'typescriptreact',
    'vue',
    'yaml',
  },
}
