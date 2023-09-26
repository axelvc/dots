---@param extension string
local function make_oppener(extension)
  return function()
    local path = vim.api.nvim_buf_get_name(0)
    local dir = vim.fs.dirname(path)
    local filename = path:match('.*/(.-)%.')

    vim.cmd(('edit %s/%s.%s'):format(dir, filename, extension))
  end
end

return {
  on_attach = function()
    require 'plugins.lsp.maps'()

    map('n', '<leader>om', make_oppener('module.ts'), { desc = 'Open module' })
    map('n', '<leader>oc', make_oppener('component.ts'), { desc = 'Open component' })
    map('n', '<leader>os', make_oppener('component.scss'), { desc = 'Open scss' })
    map('n', '<leader>oh', make_oppener('component.html'), { desc = 'Open html' })
  end,
}
