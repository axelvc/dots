local command = vim.api.nvim_create_user_command

command('Whitespace', function()
  require('mini.trailspace').trim()
end, {})

command('Format', function(args)
  local range = args.count ~= -1 and {
    ['start'] = { args.line1, 0 },
    ['end'] = { args.line2, 0 },
  } or nil

  require('conform').format { async = true, lsp_format = 'fallback', range = range }
end, { range = true })
