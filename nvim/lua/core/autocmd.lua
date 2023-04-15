local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt

local group =  vim.api.nvim_create_augroup("core", { clear = true })

-- disable auto comment on newline
autocmd('BufEnter', {
  group = group,
  pattern = '*',
  callback = function()
    o.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

-- open help pages in vertical split
autocmd('BufEnter', {
  group = group,
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

-- resize splits when window is resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = group,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- open startup-plugin page in vertical split
autocmd('Filetype', {
  group = group,
  pattern = 'startuptime',
  callback = function()
    vim.cmd 'wincmd L'
  end,
})

-- enable/disable smartcase in cmd
autocmd('CmdlineEnter', {
  group = group,
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
  group = group,
  pattern = '*',
  callback = function()
    vim.cmd 'startinsert'
  end,
})

-- highlight on yank
autocmd('TextYankPost', {
  group = group,
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

-- [[ telescope ]]
-- custom highlight for directory (path_display)
autocmd('Filetype', {
  group = group,
  pattern = 'TelescopeResults',
  callback = function()
    vim.fn.matchadd('TelescopeResultsDir', [[\w \zs.*]])
  end,
})
