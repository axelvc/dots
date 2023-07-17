local null_ls = require 'null-ls'
local lsp_maps = require 'plugins.lsp.maps'

local CONFIG_PATH = 'plugins.lsp.servers.'
local configs = {
  prettier = require(CONFIG_PATH .. 'prettier'),
  eslint = require(CONFIG_PATH .. 'eslint'),
  rome = require(CONFIG_PATH .. 'rome'),
}

null_ls.setup {
  on_attach = lsp_maps,
  sources = {
    require 'typescript.extensions.null-ls.code-actions',
    null_ls.builtins.code_actions.eslint_d.with(configs.eslint),
    null_ls.builtins.diagnostics.eslint_d.with(configs.eslint),
    null_ls.builtins.formatting.eslint_d.with(configs.eslint),
    null_ls.builtins.formatting.prettierd.with(configs.prettier),
    -- null_ls.builtins.formatting.rome.with(configs.rome),
    null_ls.builtins.formatting.stylua,
  },
}

