-- common `save file` shortcut
map({ 'n', 'v' }, '<C-s>', ':update<CR>', { silent = true })
map('i', '<C-s>', '<C-o>:w<CR>', { silent = true })
map({ 'n', 'v' }, '<leader><C-s>', ':noautocmd up<CR>', { silent = true, desc = 'Save without format' })

-- common select all
map({ 'n', 'v' }, '<C-a>', 'gg<S-v>G')

-- exit from insert mode
map('i', '<C-c>', '<Esc>')

-- increment/decrement
map({ 'n', 'v' }, '+', '<C-a>')
map({ 'n', 'v' }, '-', '<C-x>')

-- paste without yanking
map('v', 'p', '"_dP')

-- clear highlight matches
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

-- moving between tabs
map('n', '[t', 'gT', { noremap = true, desc = 'Previous tab' })
map('n', ']t', 'gt', { noremap = true, desc = 'Next tab' })

-- moving between buffers
map('n', 'H', ':bprevious<Cr>', { desc = 'Focus previous buffer', silent = true })
map('n', 'L', ':bnext<Cr>', { desc = 'Focus next buffer', silent = true })

-- delete buffer
map('n', '<leader>bd', function() Snacks.bufdelete() end, { silent = true, desc = 'Delete buffer' })

mapdata {
  '<leader>b', group = 'Buffer',
}

-- [[ neo-tree ]]
map('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })

-- [[ ufo ]]
map('n', 'zR', function() require('ufo').openAllFolds() end)
map('n', 'zM', function() require('ufo').closeAllFolds() end)

-- [[ treesj ]]
mapdata {
  '<leader>j', group = 'Join Utils',
}

map('n', '<leader>js', function() require('treesj').split() end, { desc = 'Split object' })
map('n', '<leader>jj', function() require('treesj').join() end, { desc = 'Join object' })

-- [[ comment ]]
local ctrl_slash = has 'wsl' and '<C-_>' or '<C-/>'

map('v', ctrl_slash, 'gc', { remap = true })
map('n', ctrl_slash, 'gcc', { remap = true })
-- map('i', ctrl_slash, function() require('Comment.api').toggle.linewise.current() end)

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
map('n', '<leader>n', function() Snacks.notifier.hide() end, { desc = 'Hide notifications' })

-- [[ telescope ]]
map('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Find file' })
map('n', '<leader>/', function() require('telescope.builtin').live_grep() end, { desc = 'Find word' })
map('n', '<leader><leader>', function() require('telescope.builtin').builtin() end, { desc = 'Telescope builtin' })
map('n', '<leader>gs', function() require('telescope.builtin').git_status() end, { desc = 'Status' })

-- [[ zen-mode ]]
map('n', '<leader>z', function() Snacks.zen() end, { desc = 'Zen Mode' })

-- [[ leap ]]
map('n', 'gs', function()
  local current_window = vim.fn.win_getid()
  require('leap').leap { target_windows = { current_window } }
end, { desc = 'Search word match (Leap)' })

-- [[ terminal ]]
map('n', '<leader>gt', function() Snacks.terminal.toggle('gitui') end, { desc = 'Git-UI' })
map({ 'n', 't' }, '<C-Bslash>', function() Snacks.terminal.toggle() end, { desc = 'Toggle terminal' })

-- [[ git ]]
function _G.git_maps(buffer)
  local gitsigns = require 'gitsigns'
  local git_conflict = require 'git-conflict'

  -- external
  map('n', '<leader>gg', ':Neotree toggle git_status<CR>', { buffer = buffer, desc = 'Neotree git' })

  -- conflict
  map('n', '<leader>gcc', function() git_conflict.choose('ours') end, { buffer = buffer, desc = 'Current' })
  map('n', '<leader>gci', function() git_conflict.choose('theirs') end, { buffer = buffer, desc = 'Incoming' })
  map('n', '<leader>gcb', function() git_conflict.choose('both') end, { buffer = buffer, desc = 'Both' })
  map('n', '<leader>gcr', function() git_conflict.choose('none') end, { buffer = buffer, desc = 'Reset' })

  map('n', '[c', function() git_conflict.find_prev('ours') end, { buffer = buffer, desc = 'Previous git conflict' })
  map('n', ']c', function() git_conflict.find_next('ours') end, { buffer = buffer, desc = 'Next git conflict' })

  -- navigation
  map('n', '[g', function() gitsigns.nav_hunk('prev') end, { buffer = buffer, desc = 'Previus git hunk' })
  map('n', ']g', function() gitsigns.nav_hunk('next') end, { buffer = buffer, desc = 'Next git hunk' })

  -- stage
  map({ 'n', 'v' }, '<leader>ga', gitsigns.stage_hunk, { buffer = buffer, desc = 'Stage hunk' })
  map({ 'n', 'v' }, '<leader>gr', gitsigns.reset_hunk, { buffer = buffer, desc = 'Reset hunk' })
  map('n', '<leader>gA', gitsigns.stage_buffer, { buffer = buffer, desc = 'Stage buffer' })
  map('n', '<leader>gR', gitsigns.reset_buffer, { buffer = buffer, desc = 'Undo buffer' })

  -- diff
  map('n', '<leader>gi', gitsigns.preview_hunk, { buffer = buffer, desc = 'Preview hunk float' })
  map('n', '<leader>gp', gitsigns.preview_hunk_inline, { buffer = buffer, desc = 'Preview hunk inline' })
  map('n', '<leader>gd', gitsigns.diffthis, { buffer = buffer, desc = 'Diff buffer' })

  -- git blame
  map('n', '<leader>gb', gitsigns.blame_line, { buffer = buffer, desc = 'Blame line' })
  map('n', '<leader>gB', gitsigns.toggle_current_line_blame, { buffer = buffer, desc = 'Toggle blame line' })

  -- select inner hunk
  map({ 'x', 'o' }, 'ig', gitsigns.select_hunk, { buffer = buffer, desc = 'inner git hunk' })

  mapdata {
    { '<leader>g',  group = 'Git' },
    { '<leader>gc', group = 'Conflict' },
  }
end

-- [[ LSP ]]
function _G.lsp_maps(buffer)
  local function bmap(modes, keys, map, desc)
    pcall(vim.keymap.set, modes, keys, map, {
      buffer = buffer,
      noremap = true,
      silent = true,
      unique = true,
      desc = desc,
    })
  end

  -- rename
  bmap('n', '<F2>', vim.lsp.buf.rename, 'Rename')
  bmap('n', '<leader>r', vim.lsp.buf.rename, 'Rename')

  -- hover
  bmap('', 'K', vim.lsp.buf.hover, 'Hover')
  bmap('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')

  -- code actions
  bmap('', '<leader>c', vim.lsp.buf.code_action, 'Code action')

  -- diagnostics
  bmap('n', '<leader>i', function() vim.diagnostic.open_float { scope = 'line' } end, 'Hover information')
  bmap('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end, 'Previous diagnostic')
  bmap('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end, 'Next diagnostic')
  bmap('n', '[e', function() vim.diagnostic.jump { count = -1, float = true, severity = vim.diagnostic.severity.ERROR } end, 'Previous error')
  bmap('n', ']e', function() vim.diagnostic.jump { count = 1, float = true, severity = vim.diagnostic.severity.ERROR } end, 'Next error')

  -- go-to navigations
  local telescope = require 'telescope.builtin'
  bmap('n', 'gd', telescope.lsp_definitions, 'Definition')
  bmap('n', 'gt', telescope.lsp_type_definitions, 'Type definition')
  bmap('n', 'gi', telescope.lsp_implementations, 'Implementation')
  bmap('n', 'gr', telescope.lsp_references, 'References')

  -- format
  bmap({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true, lsp_format = 'fallback' } end, 'Format code')
end

-- [[ Markdown ]]
function _G.markdown_maps(opts)
  local md = require 'render-markdown'

  map('n', '<leader>mt', md.toggle, { buffer = opts.buf, desc = 'Toggle preview' })
  map('n', '<leader>me', md.enable, { buffer = opts.buf, desc = 'Enable preview' })
  map('n', '<leader>md', md.disable, { buffer = opts.buf, desc = 'Disable preview' })
  map('n', '<leader>me', md.expand, { buffer = opts.buf, desc = 'Expand conceal' })
  map('n', '<leader>mc', md.contract, { buffer = opts.buf, desc = 'Contract conceal' })
end
