local o = vim.opt

local short_mode = {
  'mode',
  fmt = function(str)
    local short_mode = str:sub(1, 1)

    for letter in str:gmatch '-%w' do
      short_mode = short_mode .. letter
    end

    return short_mode
  end,
}

local sections = {
  lualine_a = {
    short_mode,
  },
  lualine_b = {
    { 'branch', icon = '' },
  },
  lualine_c = {
    { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
    { 'diagnostics', sources = { 'nvim_diagnostic' }, always_visible = false, symbols = vim.g.signs },
    {
      '',
      cond = function() return vim.fn.reg_recording() ~= '' end,
      fmt = function() return ('[Recording @%s]'):format(vim.fn.reg_recording()) end,
      color = 'Recording',
    },
  },
  lualine_x = {
    { 'encoding', cond = function() return o.fileencoding:get() ~= 'utf-8' end },
    {
      'lsp_status',
      icon = '',
      symbols = { done = '' },
      ignore_lsp = { 'quick_lint_js', 'typescript-tools' },
      fmt = function(str)
        if #str == 0 then return '' end

        local renames = {
          ['emmet_language_server'] = 'emmet',
          ['lua_ls'] = 'lua',
          ['harper_ls'] = 'harper',
          ['angularls'] = 'angular',
          ['cssls'] = 'css',
          ['vue_ls'] = 'vue',
        }

        table.foreach(renames, function(key, value)
          str = str:gsub(key, value)
        end)

        return str:gsub(' ', ', ')
      end,
    },
    {
      'fileformat',
      cond = function()
        return o.fileformat:get() ~= 'unix'
      end,
    },
  },
  lualine_y = { 'filetype' },
  lualine_z = { '%l:%c', '%L' },
}

require('lualine').setup {
  options = {
    section_separators = { left = '▙', right = '▟' },
    component_separators = { left = '⏽', right = '⏽' },
    padding = 2,
    globalstatus = true,
  },
  sections = sections,
  extensions = {
    {
      filetypes = { 'alpha' },
      sections = {
        lualine_a = {
          short_mode,
        },
        lualine_z = {
          {
            'branch',
            icon = '',
          },
        },
      },
    },
  },
}
