local LAZY_PATH = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- ensure lazy has been installed
if not vim.uv.fs_stat(LAZY_PATH) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    LAZY_PATH,
  }
end

vim.opt.runtimepath:prepend(LAZY_PATH)

require('lazy').setup('plugins.setup', {
  install = {
    colorscheme = { 'catppuccin', 'embark', 'monokai-pro' },
  },
  dev = {
    path = '~',
  },
  ui = {
    border = vim.opt.winborder,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'netrwPlugin',
      },
    },
  },
})
