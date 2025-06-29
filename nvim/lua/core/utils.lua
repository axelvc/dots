---wrapper for |vim.print|
_G.put = vim.print

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

---log number of calls to a function
function _G.count(key, ...)
  local n = counts[key]

  counts[key] = n + 1
  put(('%s %d'):format(key, n), ...)
end
