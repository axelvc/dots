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
    {
      'branch',
      icon = '',
    },
  },
  lualine_c = {
    {
      'diff',
      symbols = {
        added = ' ',
        modified = ' ',
        removed = ' ',
      },
    },
    {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      always_visible = false,
      symbols = vim.g.signs,
    },
  },
  lualine_x = {
    {
      'encoding',
      cond = function()
        return o.fileencoding:get() ~= 'utf-8'
      end,
    },
    {
      function()
        local buf_clients = vim.lsp.get_clients { bufnr = 0 }
        if #buf_clients == 0 then
          return 'LSP Inactive'
        end

        local buf_client_names = {}
        local copilot_active = false

        -- add client
        for _, client in pairs(buf_clients) do
          if client.name ~= 'null-ls' and client.name ~= 'copilot' then
            table.insert(buf_client_names, client.name)
          end

          if client.name == 'copilot' then
            copilot_active = true
          end
        end

        -- add formatter
        -- local formatters = require "lvim.lsp.null-ls.formatters"
        -- local supported_formatters = formatters.list_registered(buf_ft)
        -- vim.list_extend(buf_client_names, supported_formatters)

        -- add linter
        -- local linters = require "lvim.lsp.null-ls.linters"
        -- local supported_linters = linters.list_registered(buf_ft)
        -- vim.list_extend(buf_client_names, supported_linters)

        local unique_client_names = table.concat(buf_client_names, ', ')
        local language_servers = string.format('[%s]', unique_client_names)

        if copilot_active then
          language_servers = language_servers .. '%#SLCopilot#' .. ' ' .. 'Git %*'
        end

        return language_servers
      end,
      color = { gui = 'bold' },
    },
    {
      'fileformat',
      cond = function()
        return o.fileformat:get() ~= 'unix'
      end,
    },
  },
  lualine_y = {
    'filetype',
  },
  lualine_z = {
    '%l:%c',
    '%L',
  },
}

local ok, noice = pcall(require, 'noice')
if ok then
  table.insert(sections.lualine_x, 1, {
    noice.api.status.mode.get,
    cond = function()
      return noice.api.status.mode.has() and noice.api.status.mode.get():match 'recording' ~= nil
    end,
    fmt = function(str)
      return str:match '(recording @.*)'
    end,
    color = 'Recording',
  })
end

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
          'Alpha',
        },
      },
    },
  },
}
