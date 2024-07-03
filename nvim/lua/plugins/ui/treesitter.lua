local register = vim.treesitter.language.register

register('jsonc', 'json')
register('bash', 'zsh')
register('markdown', 'mdx')

require('nvim-treesitter.configs').setup {
  modules = {},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
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
}

require('ts_context_commentstring').setup {}
