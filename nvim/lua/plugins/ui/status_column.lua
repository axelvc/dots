local builtin = require('statuscol.builtin')

require('statuscol').setup({
  ft_ignore = { 'neo-tree' },
  segments = {
    { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
    { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
    { text = { '%s' },                  click = "v:lua.ScSa" },
  }
})
