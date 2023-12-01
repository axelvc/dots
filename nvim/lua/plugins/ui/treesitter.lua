local register = vim.treesitter.language.register

register('jsonc', 'json')
register('bash', 'zsh')

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
  context = {
    enable = true,
  },
  ignore_install = {},
  ensure_installed = {
    'astro',
    'bash',
    'css',
    'go',
    'graphql',
    'http',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'regex',
    'rust',
    'scss',
    'svelte',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false,
  }
}

require('ts_context_commentstring').setup {}
