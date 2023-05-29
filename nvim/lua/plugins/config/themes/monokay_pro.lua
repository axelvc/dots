local monokai_pro = require 'monokai-pro'

monokai_pro.setup({
  devicons = true,
  styles = {
    comment = { italic = true },
    keyword = { italic = true },
    type = { italic = true },
    storageclass = { italic = true },
    structure = { italic = true },
    parameter = { italic = true },
    annotation = { italic = true },
    tag_attribute = { italic = true },
  },
  filter = 'ristretto',
  plugins = {
    indent_blankline = {
      context_highlight = 'pro',
      context_start_underline = true,
    },
  },
})

monokai_pro.load()
