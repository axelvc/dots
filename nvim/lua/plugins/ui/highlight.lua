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
    disable = { 'terminal', 'toggleterm' }
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

require('nvim-ts-autotag').setup {
  aliases = {
    ['mdx'] = 'html',
  }
}

require('blink.pairs').setup({
  highlights = {
    enabled = true,
    groups = {
      'rainbow1',
      'rainbow2',
      'rainbow3',
      'rainbow4',
      'rainbow5',
      'rainbow6',
    },
  },
})
