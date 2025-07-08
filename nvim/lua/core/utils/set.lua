local Set = {}
Set.__index = Set

-- Constructor
function Set:new(items)
  local set = {}
  setmetatable(set, Set)
  set._data = {}

  if items then
    for _, item in ipairs(items) do
      set._data[item] = true
    end
  end

  return set
end

-- Add an item to the set
function Set:add(item)
  self._data[item] = true
  return self -- Allow chaining
end

-- Check if item exists in the set
function Set:has(item)
  return self._data[item] == true
end

-- Remove an item from the set
function Set:del(item)
  self._data[item] = nil
  return self -- Allow chaining
end

-- Get the size of the set
function Set:size()
  local count = 0
  for _ in pairs(self._data) do
    count = count + 1
  end
  return count
end

-- Convert set to array
function Set:to_array()
  local array = {}
  for item in pairs(self._data) do
    table.insert(array, item)
  end
  return array
end

-- String representation
function Set:__tostring()
  local items = {}
  for item in pairs(self._data) do
    table.insert(items, tostring(item))
  end
  return ('Set{%s}'):format(table.concat(items, ', '))
end

-- Iterator support
function Set:__pairs()
  return pairs(self._data)
end

-- Union operation
function Set:union(other_set)
  local result = Set:new()
  for item in pairs(self._data) do
    result:add(item)
  end
  for item in pairs(other_set._data) do
    result:add(item)
  end
  return result
end

-- Intersection operation
function Set:intersection(other_set)
  local result = Set:new()
  for item in pairs(self._data) do
    if other_set:has(item) then
      result:add(item)
    end
  end
  return result
end

-- Difference operation
function Set:difference(other_set)
  local result = Set:new()
  for item in pairs(self._data) do
    if not other_set:has(item) then
      result:add(item)
    end
  end
  return result
end

return Set
