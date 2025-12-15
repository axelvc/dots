local lint = require 'lint'
local group = vim.api.nvim_create_augroup('Lint', { clear = true })

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
  group = group,
  callback = function()
    lint.try_lint()
  end,
})
