local g = vim.g

g.mapleader = ' '
g.border = 'rounded'
g.format_on_save = {
  'markdown',
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  'json',
  'jsonc',
  'markown',
  'css',
  'html',
  'python',
  'go',
}

--diagnostic icons
local signs = {
  error = ' ', -- 
  warn = ' ', -- 
  info = ' ', -- 
  hint = ' ', -- 
  debug = ' ',
}

-- notify
signs.DEBUG = signs.debug
signs.ERROR = signs.error
signs.INFO  = signs.info
signs.TRACE = signs.info
signs.WARN  = signs.warn

vim.g.signs = signs

-- keymap-set shortcut
_G.map = vim.keymap.set

-- easy inspect
_G.put = vim.print

local counts = setmetatable({}, {
  __index = function(self, key)
    self[key] = 1
    return 1
  end,
})

function _G.count(name, ...)
  put(('%s %s'):format(name, counts[name]), ...)
  counts[name] = counts[name] + 1
end

-- has utility wrap
function _G.has(v)
  return vim.fn.has(v) == 1
end

-- code runner
function vim.g.code_runner()
  local extensions = {
    lua = 'luajit %s',
    rust = 'cargo run',
    typescript = 'bun %s',
    javascript = 'node %s',
    python = 'python3 %s',
    sh = 'sh %s',
    go = 'go run %s',
  }

  local path = vim.api.nvim_buf_get_name(0)
  local filetype = vim.opt.filetype:get()
  local runner = extensions[filetype]

  if runner then
    vim.cmd(('update | vnew | terminal %s'):format(runner:format(path)))
    vim.cmd 'keepalt file output'
  else
    vim.notify('Runner not implemented', vim.log.levels.ERROR)
  end
end
