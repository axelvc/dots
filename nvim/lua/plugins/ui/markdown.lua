local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup('Core', { clear = true })
local md = require 'render-markdown'

local exists, wk = pcall(require, 'which-key')
if exists then
  wk.add {
    { '<leader>m', group = 'Markdown' },
  }
end
-- autocmd('BufNew', {
--   group = group,
--   desc = 'Commands for MD files',
--   pattern = { '*.mdx', '*.md' },
--   callback = function()
--     local opts = { buffer = true, noremap = true, silent = true }

--     local function bmap(modes, keys, map, desc)
--       vim.keymap.set(modes, keys, map, vim.tbl_extend('force', { desc = desc }, opts))
--     end

    map('n', '<leader>mt', md.toggle,   { desc = 'Toggle preview' })
    map('n', '<leader>me', md.enable,   { desc = 'Enable preview' })
    map('n', '<leader>md', md.disable,  { desc = 'Disable preview' })
    -- map('n', '<leader>me', md.expand,   { desc = 'Expand conceal' })
    -- map('n', '<leader>mc', md.contract, { desc = 'Contract conceal' })
--   end,
-- })

md.setup {
  file_types = { 'markdown', 'mdx' },
}
