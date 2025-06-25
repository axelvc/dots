local command = vim.api.nvim_buf_create_user_command

local M = {}

function M.init(s)
  -- disable folding for angularls
  if s.name == 'angularls' then
    s.server_capabilities.foldingRangeProvider = false
  end

  local opts = { buffer = true, noremap = true, silent = true }

  local function bmap(modes, keys, map, desc)
    vim.keymap.set(modes, keys, map, vim.tbl_extend('force', { desc = desc }, opts))
  end

  -- rename
  bmap('n', '<F2>', vim.lsp.buf.rename, 'Rename')
  bmap('n', '<leader>R', vim.lsp.buf.rename, 'Rename')

  -- hover
  bmap('', 'K', vim.lsp.buf.hover, 'Hover')
  bmap('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')

  -- code actions
  bmap('', '<Leader>a', vim.lsp.buf.code_action, 'Code action')

  -- diagnostics
  bmap('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end, 'Previous diagnostic')
  bmap('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end, 'Next diagnostic')
  -- stylua: ignore start
  bmap('n', '[e', function() vim.diagnostic.jump { count = -1, float = true, severity = vim.diagnostic.severity.ERROR } end, 'Previous error')
  bmap('n', ']e', function() vim.diagnostic.jump { count = 1, float = true, severity = vim.diagnostic.severity.ERROR } end, 'Next error')
  bmap('n', '<Leader>i', function() vim.diagnostic.open_float { scope = 'line' } end, 'Hover information')
  bmap('n', '<Leader>d', function() require('trouble').toggle 'workspace_diagnostics' end, 'Diagnostics')

  -- goto navigations
  bmap('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, 'Definition')
  bmap('n', 'gD', function() require('goto-preview').goto_preview_definition {} end, 'Preview definition')
  bmap('n', 'gt', function() require('telescope.builtin').Psp_type_definitions {} end, 'Type definition')
  bmap('n', 'gi', function() require('telescope.builtin').lsp_implementations {} end, 'Implementation')
  bmap('n', 'gr', function() require('telescope.builtin').lsp_references {} end, 'References')
  bmap('n', 'gP', function() require('goto-preview').close_all_win() end, 'Close all `goto` previews')

  bmap('n', 'gS', function()
    vim.cmd('vsplit')
    require('telescope.builtin').lsp_definitions()
  end, 'Split definition')
  -- stylua: ignore end

  -- format
  bmap('n', '<Leader><C-s>', ':noautocmd up<CR>', 'Save without format')
  bmap({ 'n', 'v' }, '<Leader>f', function()
    require('conform').format { async = true, lsp_format = 'fallback' }
  end, 'Format code')

  command(0, 'Format', function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        ['start'] = { args.line1, 0 },
        ['end'] = { args.line2, end_line:len() },
      }
    end
    require('conform').format { async = true, lsp_format = 'fallback', range = range }
  end, { range = true })
end

return M
