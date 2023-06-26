local command = vim.api.nvim_create_user_command

require('neogen').setup {}

command('Docgen', 'Neogen', {})
