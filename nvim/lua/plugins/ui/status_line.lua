---@class TabItem
---@field icon string
---@field filetype string
---@field on_click function

---@class Data
---@field tabs TabItem[]

---@param data TabItem
local function tab_item(data)
  return {
    function() return data.icon .. ' ' end,
    color = function() return vim.o.filetype == data.filetype and 'ActiveItem' or '' end,
    on_click = data.on_click,
  }
end

local function conflict_count()
  return require('git-conflict').conflict_count(vim.api.nvim_get_current_buf())
end

require('lualine').setup {
  options = {
    section_separators = { left = '▙', right = '▟' },
    component_separators = { left = '|', right = '' },
    padding = 1,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        padding = 2,
        fmt = function(str)
          local short_mode = str:sub(1, 1)

          for letter in str:gmatch '-%w' do
            short_mode = short_mode .. letter
          end

          return short_mode
        end,
      }
    },
    lualine_b = {
    },
    lualine_c = {
      {
        'branch',
        icon = '',
        padding = { left = 2, right = 1 },
      },
      { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
      {
        function() return ' ' .. conflict_count() end,
        cond = function() return conflict_count() > 0 end,
      },
      { 'diagnostics', sources = { 'nvim_diagnostic' }, always_visible = false, symbols = vim.g.signs },
    },
    lualine_x = {
      {
        function() return ('[Recording @%s]'):format(vim.fn.reg_recording()) end,
        cond = function() return vim.fn.reg_recording() ~= '' end,
        color = 'Recording',
      },
      { 'filetype' },
      tab_item {
        icon = '',
        filetype = 'TelescopePrompt',
        on_click = function() require('telescope.builtin').find_files() end,
      },
      tab_item {
        icon = '',
        filetype = 'snacks_terminal',
        on_click = function() Snacks.terminal.toggle() end,
      },
      tab_item {
        icon = '󰙅',
        filetype = 'neo-tree',
        on_click = function() vim.api.nvim_input('<C-n>') end,
      }
    },
    lualine_y = {},
    lualine_z = {}
  },
}
