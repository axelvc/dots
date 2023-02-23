require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
  playground = {
    enable = true,
  },
  ensure_installed = {
    'astro',
    'bash',
    'css',
    'go',
    'graphql',
    'help',
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

require('nvim-treesitter.parsers').filetype_to_parsername.json = 'jsonc'
require('nvim-treesitter.parsers').filetype_to_parsername.zsh = 'bash'
