return {
  filter = function(diagnostic)
    if diagnostic.message:lower():match 'no eslint configuration found' then
      return
    end

    return diagnostic
  end,
}
