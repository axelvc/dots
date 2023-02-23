local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt

-- disable auto comment on newline
autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    o.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

-- open help pages in vertical split
autocmd('BufEnter', {
  pattern = '*.txt',
  callback = function()
    if o.buftype:get() == 'help' and not vim.b.moved then
      vim.cmd 'wincmd L'
      vim.b.moved = true
    end

    autocmd('BufDelete', {
      buffer = 0,
      callback = function()
        vim.b.moved = false
      end,
    })
  end,
})

-- open startup-plugin page in vertical split
autocmd('Filetype', {
  pattern = 'startuptime',
  callback = function()
    vim.cmd 'wincmd L'
  end,
})

-- enable/disable smartcase in cmd
autocmd('CmdlineEnter', {
  pattern = '*',
  callback = function()
    o.smartcase = false
  end,
})

autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    o.smartcase = true
  end,
})

-- start teminals in insert mode
autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.cmd 'startinsert'
  end,
})

-- highlight on yank
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

-- [[ telescope ]]
-- custom highlight for directory (path_display)
autocmd('Filetype', {
  pattern = 'TelescopeResults',
  callback = function()
    vim.fn.matchadd('TelescopeResultsDir', [[\w \zs.*]])
  end,
})
