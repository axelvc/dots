local builtin = require('statuscol.builtin')

require('statuscol').setup({
  ft_ignore = { 'neo-tree' },
  segments = {
    { sign = { name = { 'Diagnostic' } }, click = 'v:lua.ScSa' },
    { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
    { sign = { name = { '.*' }, maxwidth = 2, colwidth = 1 }, click = 'v:lua.ScSa' },
    { text = { '%s' }, click = "v:lua.ScSa" },
    { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
  }
})
