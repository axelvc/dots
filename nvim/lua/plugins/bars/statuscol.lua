local builtin = require('statuscol.builtin')

require('statuscol').setup({
  ft_ignore = { 'neo-tree' },
  segments = {
    { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
    { text = { '%s' }, click = "v:lua.ScSa" },
    { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
  }
})
