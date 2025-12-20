---wrapper for |vim.print|
_G.put = function(...) Snacks.debug.inspect(...) end

---wrapper for |vim.fn.has|
_G.has = function(arg) return vim.fn.has(arg) == 1 end

---wrapper for |vim.keymap.set|
_G.map = vim.keymap.set

--- Safe setter for which-key data
local pending_maps = {}
function _G.mapdata(mappings)
  local ok, wk = pcall(require, 'which-key')

  if not ok then
    table.insert(pending_maps, mappings)
    return
  end

  if pending_maps then
    for _, v in pairs(pending_maps) do
      wk.add(v)
    end

    pending_maps = nil
  end

  wk.add(mappings)
end

_G.Set = require 'core.utils.set'
