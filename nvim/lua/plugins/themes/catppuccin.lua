local catppuccin = require 'catppuccin'

catppuccin.setup {
  transparent_background = false,
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
    telescope = {
      enabled = false,
    },
    treesitter = true,
    which_key = true,
    treesitter_context = true,
    snacks = {
      enabled = true,
      indent_scope_color = 'mauve',
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
    all = function(c)
      return {
        -- Normal = { fg = c.text, bg = '' },
        Folded = { bg = c.surface0 },
        -- lsp/cmp
        FloatBorder = { bg = c.mantle, fg = c.flamingo },
        Pmenu = { bg = c.mantle, fg = c.subtext0 },
        PmenuSbar = { bg = c.surface0, fg = c.mantle },
        PmenuThumb = { bg = c.peach, fg = c.mantle },
        NormalFLoat = { bg = c.crust, fg = c.text },
        NoiceCmdlinePopup = { link = 'Normalfloat' },
        NoiceCmdlinePopupBorder = { fg = c.crust },
        -- nvim-treesitter-context
        TreesitterContextBottom = { bg = c.crust, style = {} },
        -- lualine
        Recording = { fg = c.peach },
        ActiveItem = { fg = c.mauve },
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
        -- pickers
        SnacksPickerBorder = { bg = c.crust, fg = c.surface0 },
      }
    end,
  },
}

catppuccin.load()
