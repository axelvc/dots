local o = vim.opt
local lsp_renames = {
  ['emmet_language_server'] = 'emmet',
  ['lua_ls'] = 'lua',
  ['harper_ls'] = 'harper',
  ['angularls'] = 'angular',
  ['cssls'] = 'css',
  ['vue_ls'] = 'vue',
  ['quick_lint_js'] = 'grammar',
  ['typescript-tools'] = 'ts',
}

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
      function() return ('[Recording @%s]'):format(vim.fn.reg_recording()) end,
      cond = function() return vim.fn.reg_recording() ~= '' end,
      color = 'Recording',
    },
  },
  lualine_x = {},
  lualine_y = {
    { 'encoding', cond = function() return o.fileencoding:get() ~= 'utf-8' end },
    {
      function()
        local clients = vim.lsp.get_clients()

        if #clients == 0 then return '' end

        clients = vim.tbl_map(function(client)
          return lsp_renames[client.name] or client.name
        end, clients)

        return table.concat(clients, ' ⏽ ')
      end,
    },
    {
      'fileformat',
      cond = function()
        return o.fileformat:get() ~= 'unix'
      end,
    },
  },
  lualine_z = { 'filetype' }
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
        lualine_b = {
          {
            'branch',
            icon = '',
          },
        },
        lualine_z = {
          function() return ('%s Plugins'):format(require('lazy').stats().count) end,
        }
      },
    },
  },
}
