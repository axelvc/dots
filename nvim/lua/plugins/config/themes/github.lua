local github = require 'github-theme'

github.setup({
  options = {
    styles = {
      comments = 'italic',
      functions = 'NONE',
      keywords = 'italic',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = {}, -- Apply dark background to specific windows
      },
    },
    modules = { -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

github.load()
