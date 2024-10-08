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
    'htmlangular',
    'javascriptreact',
    'less',
    'markdown',
    'scss',
    'svelte',
    'typescriptreact',
    'vue',
    'yaml',
    'javascript',
    'json',
    'jsonc',
    'typescript',
  },
}
