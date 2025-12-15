---wrapper for |vim.print|
_G.put = function(...) Snacks.debug.inspect(...) end

---wrapper for |vim.fn.has|
_G.has = function(arg) return vim.fn.has(arg) == 1 end

---wrapper for |vim.keymap.set|
_G.map = vim.keymap.set

---@type table<string, number>
local counts = setmetatable({}, {
  __index = function(self, key)
    self[key] = 1
    return 1
  end,
})

--- Safe setter for which-key data
_G.mapdata = setmetatable({}, {
  __newindex = function(self, key, value)
    local ok, wk = pcall(require, 'which-key')

    if ok then wk.add(value) end
    rawset(self, key, ok)
  end,
})

_G.Set = require 'core.utils.set'
