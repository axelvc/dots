local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup('Markdown', { clear = true })
local md = require 'render-markdown'

autocmd('BufNew', {
  group = group,
  desc = 'Commands for MD files',
  pattern = { '*.mdx', '*.md' },
  callback = function()
    local opts = { buffer = true, noremap = true, silent = true }

    local function bmap(modes, keys, map, desc)
      vim.keymap.set(modes, keys, map, vim.tbl_extend('force', { desc = desc }, opts))
    end

    bmap('n', '<leader>mt', md.toggle, { desc = 'Toggle preview' })
    bmap('n', '<leader>me', md.enable, { desc = 'Enable preview' })
    bmap('n', '<leader>md', md.disable, { desc = 'Disable preview' })
    bmap('n', '<leader>me', md.expand, { desc = 'Expand conceal' })
    bmap('n', '<leader>mc', md.contract, { desc = 'Contract conceal' })
  end,
})

md.setup {
  file_types = { 'markdown', 'mdx' },
}

local exists, wk = pcall(require, 'which-key')
if exists then
  wk.add {
    { '<leader>m', group = 'Markdown' },
  }
end
