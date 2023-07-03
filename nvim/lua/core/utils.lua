---wrapper for |vim.print|
_G.put = vim.print

---wrapper for |vim.keymap.set|
_G.map = vim.keymap.set

---wrapper for |vim.fn.has|
_G.has = function(arg) return vim.fn.has(arg) == 1 end

---@type table<string, number>
local counts = setmetatable({}, {
  __index = function(self, key)
    self[key] = 1
    return 1
  end,
})

---log number of calls to a function
function _G.count(key, ...)
  local n = counts[key]

  counts[key] = n + 1
  put(('%s %d'):format(key, n), ...)
end

-- code runner
function _G.code_runner()
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

local g = vim.g

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
  error = '󰅚 ', -- 
  warn = ' ', -- 
  info = ' ', -- 
  hint = ' ', -- 󰌵
  debug = ' ',
}

-- notify
signs.DEBUG = signs.debug
signs.ERROR = signs.error
signs.INFO  = signs.info
signs.TRACE = signs.info
signs.WARN  = signs.warn

vim.g.signs = signs
