local catppuccin = require 'catppuccin'
local c = require('catppuccin.palettes').get_palette()

catppuccin.setup {
  transparent_background = true,
  background = {
    light = 'latte',
    dark = 'mocha',
  },
  styles = {
    booleans = { 'italic' },
    comments = { 'italic' },
    conditionals = { 'italic' },
    functions = {},
    keywords = { 'italic' },
    loops = { 'italic' },
    numbers = {},
    operators = {},
    properties = {},
    strings = {},
    types = { 'italic' },
    variables = {},
  },
  integrations = {
    bufferline = true,
    cmp = true,
    gitsigns = true,
    illuminate = true,
    leap = true,
    markdown = true,
    mason = true,
    window_picker = true,
    neotree = true,
    notify = true,
    telescope = true,
    treesitter = true,
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dap = {
      enabled = true,
      enable_ui = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
  },
  highlight_overrides = {
    all = {
      Folded = { bg = c.surface0 },
      -- lsp/cmp
      FloatBorder = { bg = c.mantle, fg = c.flamingo },
      Pmenu = { bg = c.mantle, fg = c.subtext0 },
      PmenuSbar = { bg = c.surface0, fg = c.mantle },
      PmenuThumb = { bg = c.peach, fg = c.mantle },
      NormalFLoat = { bg = c.crust, fg = c.text },
      NoiceCmdlinePopup = { link = 'Normalfloat' },
      NoiceCmdlinePopupBorder = { fg= c.crust },
      -- lualine
      Recording = { fg = c.peach },
      -- neo-tree
      NeoTreeTabActive = { bg = c.base },
      NeoTreeTabInactive = { bg = c.mantle },
      NeoTreeTabSeparatorInactive = { fg = c.lavender },
      NeoTreeTabSeparatorActive = { fg = c.lavender },
      -- whitespace
      MiniTrailspace = { bg = c.red },
      -- startup
      MiniStarterHeader = { fg = c.blue },
      MiniStarterFooter = { fg = c.mauve },
      MiniStarterQuery = { fg = c.red },
      -- surround
      NvimSurroundHighlight = { bg = c.red, fg = c.surface0 },
      -- telescope
      TelescopePromptNormal = { bg = c.surface0 },
      TelescopePromptBorder = { bg = c.surface0, fg = c.blue },
      TelescopePromptCounter = { bg = c.surface0, fg = c.subtext0 },
      TelescopePromptTitle = { bg = c.blue, fg = c.surface0 },

      TelescopeResultsNormal = { bg = c.mantle },
      TelescopeResultsBorder = { bg = c.mantle, fg = c.maroon },
      TelescopeResultsTitle = { bg = c.maroon, fg = c.mantle },
      TelescopeSelection = { bg = c.surface0, fg = c.pink },
      TelescopeResultsDir = { fg = c.surface2 },

      TelescopePreviewNormal = { bg = c.crust },
      TelescopePreviewBorder = { bg = c.crust, fg = c.pink },
      TelescopePreviewTitle = { bg = c.pink, fg = c.crust },
    },
  },
}

catppuccin.load()
