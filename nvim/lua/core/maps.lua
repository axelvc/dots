-- common `save file` shortcut
map({ 'n', 'v' }, '<C-s>', ':update<CR>', { silent = true })
map('i', '<C-s>', '<C-o>:w<CR>', { silent = true })

-- common select all
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

-- don't add single character to clipboard on delete
map('n', 'x', '"_x')
map('n', 'X', '"_X')

-- prev/next history command
map('c', '<M-k>', '<Up>')
map('c', '<M-j>', '<Down>')

-- code runner
map({ 'n', 'i', 'v' }, '<F5>', code_runner)

-- TODO: MOVE THIS TO OWNS FILES

-- [[ neo-tree ]]
map('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })

-- [[ ufo ]]
map('n', 'zR', function() require('ufo').openAllFolds() end)
map('n', 'zM', function() require('ufo').closeAllFolds() end)

-- [[ treesj ]]
map('n', '<Leader>js', function() require('treesj').split() end, { desc = 'Split object' })
map('n', '<Leader>jj', function() require('treesj').join() end, { desc = 'Join object' })

-- [[ bufferline ]]
map('n', '<Leader>bd', ':bp | bd #<CR>', { silent = true, desc = 'Delete' })

map('n', '<Leader>bs', function() require('bufferline').pick() end, { desc = 'Select' })

map('n', '<Leader>bh', function() require('bufferline').move(-1 * vim.v.count1) end, { desc = 'Move current to left' })
map('n', '<Leader>bl', function() require('bufferline').move(1 * vim.v.count1) end, { desc = 'Move current to right' })

for i = 1, 9 do
  local lhs = ('<M-%s>'):format(i)
  map('n', lhs, function() require('bufferline').go_to(i, true) end, { desc = 'Go to buffer ' .. i })
end

-- focus hover
map('n', 'H', function() require('bufferline').cycle(-1 * vim.v.count1) end)
map('n', 'L', function() require('bufferline').cycle(1 * vim.v.count1) end)

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

-- [[ goto_fn ]]
map('n', 'gF', function() require('goto_fn').goto_start() end, { desc = 'Go to function definition' })

-- [[ notify ]]
map('n', '<leader>n', function() require('notify').dismiss {} end, { desc = 'Hide notifications' })

-- [[ telescope ]]
map('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Find file' })
map('n', '<Leader>/', function() require('telescope.builtin').live_grep() end, { desc = 'Find word' })
map('n', '<Leader><Leader>', function() require('telescope.builtin').builtin() end, { desc = 'Telescope builtin' })
map('n', '<leader>gB', function() require('telescope.builtin').git_branches() end, { desc = 'Branches' })
map('n', '<leader>gs', function() require('telescope.builtin').git_status() end, { desc = 'Status' })

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

-- [[ dap ]]
-- map('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
-- map('n', '<leader>c', function() require('dap').continue() end, { desc = 'Continue' })

-- [[ toggleterm ]]
local gitui
local lazygit

map('n', '<Leader>gt', function() 
  if not gitui then
    gitui = require('toggleterm.terminal').Terminal:new {
      cmd = 'gitui',
      hidden = true,
    }
  end

  gitui:toggle()
end, { desc = 'Git-UI' })

map('n', '<Leader>gT', function()
  if not lazygit then
    lazygit = require('toggleterm.terminal').Terminal:new {
      cmd = 'lazygit',
      hidden = true,
    }
  end

  lazygit:toggle()
end, { desc = 'Lazygit' })
