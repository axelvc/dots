local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_buf_create_user_command

local M = {}

M.ignore_format_list = {
  'html',
  'jsonls',
  'tsserver',
  'sumneko_lua',
}

function M.format_filter(client)
  return not vim.tbl_contains(M.ignore_format_list, client.name)
end

function M.format(opts)
  vim.lsp.buf.format(vim.tbl_extend('force', {
    async = true,
    filter = M.format_filter,
  }, opts or {}))
end

function M.format_on_save()
  local filetype = vim.opt.filetype:get()

  if vim.tbl_contains(vim.g.format_on_save, filetype) then
    M.format()
  end
end

function M.set_maps()
  local opts = { buffer = true, noremap = true, silent = true }

  local function bmap(modes, keys, map, desc)
    vim.keymap.set(modes, keys, map, vim.tbl_extend('force', { desc = desc }, opts))
  end

  -- rename
  bmap('n', '<F2>', vim.lsp.buf.rename)

  -- hover
  bmap('', 'K', vim.lsp.buf.hover)
  bmap('n', '<C-k>', vim.lsp.buf.signature_help)

  -- code actions
  bmap('', '<Leader>a', vim.lsp.buf.code_action, 'Code action')

  -- diagnostics
  bmap('n', '[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
  bmap('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
  -- stylua: ignore start
  bmap('n', '[e', function() vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR } end, 'Previous error')
  bmap('n', ']e', function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR } end, 'Next error')
  bmap('n', '<Leader>i', function() vim.diagnostic.open_float { scope = 'line' } end, 'Hover information')
  bmap('n', '<Leader>d', function() require('trouble').toggle 'workspace_diagnostics' end, 'Diagnostics')

  -- goto navigations
  bmap('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, 'Definition')
  bmap('n', 'gD', function() require('goto-preview').goto_preview_definition {} end, 'Preview definition')
  bmap('n', 'gt', function() require('goto-preview').goto_preview_type_definition {} end, 'Type definition')
  bmap('n', 'gi', function() require('goto-preview').goto_preview_implementation {} end, 'Implementation')
  bmap('n', 'gr', function() require('goto-preview').goto_preview_references {} end, 'References')
  bmap('n', 'gP', function() require('goto-preview').close_all_win() end, 'Close all `goto` previews')
  -- stylua: ignore end

  -- format
  bmap('n', '<Leader><C-s>', ':noautocmd up<CR>', 'Save without format')
  bmap({ 'n', 'v' }, '<Leader>f', M.format, 'Format code')

  command(0, 'Format', function() M.format() end, {})

  vim.api.nvim_clear_autocmds({
    event = 'BufWritePre',
    buffer = 0,
  })
  autocmd('BufWritePre', {
    desc = 'Format on save',
    callback = M.format_on_save,
    buffer = 0,
  })
end

return M.set_maps
