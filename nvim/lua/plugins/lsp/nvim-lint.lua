local lint = require 'lint'

lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}

lint.linters.eslint_d = require('lint.util').wrap(lint.linters.eslint_d, function(diagnostic)
  if diagnostic.message:lower():match 'no eslint configuration found' then
    return
  end

  return diagnostic
end)

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    lint.try_lint()
  end,
})
