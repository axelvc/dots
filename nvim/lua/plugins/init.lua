local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- ensure lazy has been installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end

vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup('plugins.setup', {
  install = {
    colorscheme = { 'catppuccin' },
  },
  dev = {
    path = '~',
  },
  ui = {
    border = vim.g.border,
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
