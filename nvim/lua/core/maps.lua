local g = vim.g

-- [[ core ]]
-- classic save file
map('n', '<C-s>', ':update<CR>', { silent = true })
map('i', '<C-s>', '<C-o>:w<CR>', { silent = true })

-- classic select all
map({ 'n', 'v' }, '<C-a>', 'gg<S-v>G')

-- exit from insert mode
map('i', '<C-c>', '<Esc>')

-- increment/decrement
map({ 'n', 'v' }, '+', '<C-a>')
map({ 'n', 'v' }, '-', '<C-x>')

-- paste without yanking
map('v', 'p', '"_dP')

-- clear higlight matches
map('n', '<C-h>', ':nohlsearch<CR>', { silent = true })

-- stay in visual mode on indent
map('v', '<', '<gv')
map('v', '>', '>gv')

-- not add single character to clipboard on delete
map('n', 'x', '"_x')
map('n', 'X', '"_X')

-- prev/next history command
map('c', '<M-k>', '<Up>')
map('c', '<M-j>', '<Down>')

-- code runner
map({ 'n', 'i', 'v' }, '<F5>', g.code_runner)

-- [[ neo-tree ]]
map('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })

-- [[ ufo ]]
map('n', 'zR', function() require('ufo').openAllFolds() end)
map('n', 'zM', function() require('ufo').closeAllFolds() end)

-- [[ treesj ]]
map('n', '<Leader>js', function() require('treesj').split() end, { desc = 'Split object' })
map('n', '<Leader>jj', function() require('treesj').join() end, { desc = 'Join object' })

-- [[ bufferline ]]
map('n', '<Leader>bd', ':bp|bd #<CR>', { silent = true, desc = 'Delete' })

map('n', '<Leader>bs', function() require('bufferline').pick_buffer() end, { desc = 'Select' })

map('n', '<Leader>bh', function() require('bufferline').move(-1) end, { desc = 'Move current to left' })
map('n', '<Leader>bl', function() require('bufferline').move(1) end, { desc = 'Move current to right' })

for i = 1, 9 do
  local lhs = ('<M-%s>'):format(i)
  map('n', lhs, function() require('bufferline').go_to_buffer(i) end, { desc = 'Go to buffer ' .. i })
end

-- focus hover
map('n', 'H', function() require('bufferline').cycle(-1) end)
map('n', 'L', function() require('bufferline').cycle(1) end)

-- [[ comment ]]
local ctrl_slash = has 'wsl' and '<C-_>' or '<C-/>'

map('v', ctrl_slash, 'gc', { remap = true })
map('n', ctrl_slash, 'gcc', { remap = true })
map('i', ctrl_slash, function() require('Comment.api').toggle.linewise.current() end)

-- [[ noice ]]
-- scroll hover
map({ 'n', 'i' }, '<c-f>', function()
  if not require('noice.lsp').scroll(4) then
    return '<c-f>'
  end
end, { silent = true, expr = true })

map({ 'n', 'i' }, '<c-b>', function()
  if not require('noice.lsp').scroll(-4) then
    return '<c-b>'
  end
end, { silent = true, expr = true })

-- [[ unito ]]
map('n', '<leader>p', function() require('unito').toggle_px_rem() end, { desc = ' Toggle px/rem' })

-- [[ notify ]]
map('n', '<leader>n', function() require('notify').dismiss {} end, { desc = 'Hide notifications' })

-- [[ telescope ]]
map('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Find file' })
map('n', '<Leader>/', function() require('telescope.builtin').live_grep() end, { desc = 'Find word' })
map('n', '<Leader><Leader>', function() require('telescope.builtin').builtin() end, { desc = 'Telescope builtin' })

-- [[ zen mode ]]
map('n', '<Leader>z', function() require('zen-mode').toggle() end, { desc = 'Zen Mode' })

-- [[ codeium ]]
map('i', '<C-l>', function()
  return vim.fn['codeium#Accept']()
end, { expr = true, silent = true })

-- [[ leap ]]
map('n', 'gs', function()
  local current_window = vim.fn.win_getid()
  require('leap').leap { target_windows = { current_window } }
end, { desc = 'Search word match (Leap)' })
