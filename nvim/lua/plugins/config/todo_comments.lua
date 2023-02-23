require('todo-comments').setup {
  keywords = {
    FIX  = { icon = ' ', color = 'error',   alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
    NOTE = { icon = ' ', color = 'hint',    alt = { 'INFO' } },
    SEC  = { icon = ' ', color = 'extra',   alt = { 'SECTION', 'ANCHOR' } },
    TODO = { icon = ' ', color = 'info' },
    HACK = { icon = ' ', color = 'warning' },
    PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
  },
  colors = {
    error   = { 'LspDiagnosticsDefaultError',       'ErrorMsg',   '#DC2626' },
    warning = { 'LspDiagnosticsDefaultWarning',     'WarningMsg', '#FBBF24' },
    info    = { 'LspDiagnosticsDefaultInformation',               '#2563EB' },
    hint    = { 'LspDiagnosticsDefaultHint',                      '#10B981' },
    extra   = { 'SpecialKey',                                     '#C792EA' },
    default = { 'Identifier',                                     '#7C3AED' },
  },
}
