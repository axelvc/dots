local null_ls = require 'null-ls'
local set_maps = require 'plugins.config.lsp.mapping'
local prettier_config = require 'plugins.config.lsp.languages.prettier'
local eslint_config = require 'plugins.config.lsp.languages.eslint'
local bash_config = require 'plugins.config.lsp.languages.bash'

null_ls.setup {
  on_attach = set_maps,
  sources = {
    require 'typescript.extensions.null-ls.code-actions',
    null_ls.builtins.code_actions.eslint_d.with(eslint_config),
    null_ls.builtins.diagnostics.eslint_d.with(eslint_config),
    null_ls.builtins.formatting.eslint_d.with(eslint_config),
    null_ls.builtins.formatting.prettierd.with(prettier_config),
    null_ls.builtins.formatting.shfmt.with(bash_config),
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.stylua,
  },
}
