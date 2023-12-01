return {
  condition = function(utils)
    local variants = { '', '.js', '.cjs', '.mjs', '.json', '.yaml' }

    for _, v in ipairs(variants) do
      if utils.root_has_file('.eslintrc' .. v) then
        return true
      end
    end

    return false
  end,
}
