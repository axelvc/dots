local eslint_config = require 'plugins.lsp.servers.eslint'
local lint = require 'lint'

lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}

lint.linters.eslint_d = require('lint.util').wrap(lint.linters.eslint_d, eslint_config.filter)

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    lint.try_lint()
  end,
})
