local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt

local group = vim.api.nvim_create_augroup('Core', { clear = true })

autocmd('BufNew', {
  desc = 'Disable auto comment on newline',
  group = group,
  pattern = '*',
  callback = function()
    o.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

autocmd('BufEnter', {
  desc = 'Open help in vertical split',
  group = group,
  pattern = '*.txt',
  callback = function()
    if o.buftype:get() ~= 'help' or vim.b.opened then
      return
    end

    vim.cmd 'wincmd L'
    vim.b.opened = true

    autocmd('BufDelete', {
      desc = 'Cleanup for vertical help',
      group = group,
      once = true,
      buffer = 0,
      callback = function()
        vim.b.opened = false
      end,
    })
  end,
})

autocmd('VimResized', {
  desc = 'Resize splits when window is resized',
  group = group,
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

autocmd('CmdlineEnter', {
  desc = 'Disable smartcase in cmd',
  group = group,
  pattern = '*',
  callback = function()
    o.smartcase = false
  end,
})

autocmd('CmdlineLeave', {
  desc = 'Enable smartcase out of cmd',
  pattern = '*',
  group = group,
  callback = function()
    o.smartcase = true
  end,
})

autocmd('TermOpen', {
  desc = 'Start terminal in insert mode',
  group = group,
  pattern = '*',
  callback = function()
    vim.cmd 'startinsert'
  end,
})

autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = group,
  callback = function()
    vim.hl.on_yank { timeout = 200 }
  end,
})

autocmd('Filetype', {
  group = group,
  desc = 'Custom highlight for directory',
  pattern = 'TelescopeResults',
  callback = function()
    vim.fn.matchadd('TelescopeResultsDir', [[\w \zs.*]])
  end,
})
