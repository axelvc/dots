local gitsigns = require 'gitsigns'

gitsigns.setup {
  trouble = false,
  signs_staged_enable = false,
  current_line_blame_opts = {
    delay = 100,
  },
  on_attach = function(bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local function bmap(modes, keys, map, desc)
      vim.keymap.set(modes, keys, map, vim.tbl_extend('force', { desc = desc }, opts))
    end

    -- external
    bmap('n', '<leader>gg', ':Neotree toggle git_status<CR>', 'Neotree git')

    -- conflict
    bmap('n', '<leader>gcc', ':GitConflictChooseOurs<CR>', 'Current')
    bmap('n', '<leader>gci', ':GitConflictChooseTheirs<CR>', 'Incoming')
    bmap('n', '<leader>gcb', ':GitConflictChooseBoth<CR>', 'Both')
    bmap('n', '<leader>gcr', ':GitConflictChooseNone<CR>', 'Reset')

    bmap('n', '[c', ':GitConflictPrevConflict<CR>', 'Previous git conflict')
    bmap('n', ']c', ':GitConflictNextConflict<CR>', 'Next git conflict')

    -- navigation
    bmap('n', '[g', function() gitsigns.nav_hunk('prev') end, 'Previus git hunk')
    bmap('n', ']g', function() gitsigns.nav_hunk('next') end, 'Next git hunk')

    -- stage
    bmap({ 'n', 'v' }, '<leader>ga', gitsigns.stage_hunk, 'Stage hunk')
    bmap({ 'n', 'v' }, '<leader>gr', gitsigns.reset_hunk, 'Reset hunk')
    bmap('n', '<leader>gu', gitsigns.undo_stage_hunk, 'Undo hunk')
    bmap('n', '<leader>gA', gitsigns.stage_buffer, 'Stage buffer')
    bmap('n', '<leader>gR', gitsigns.reset_buffer, 'Undo buffer')

    -- diff
    bmap('n', '<leader>gi', gitsigns.preview_hunk, 'Preview hunk float')
    bmap('n', '<leader>gp', gitsigns.preview_hunk_inline, 'Preview hunk inline')
    bmap('n', '<leader>gd', gitsigns.diffthis, 'Diff buffer')

    -- git blame
    bmap('n', '<leader>gb', gitsigns.blame_line, 'Blame line')
    bmap('n', '<leader>gB', gitsigns.toggle_current_line_blame, 'Toggle blame line')

    -- select inner hunk
    bmap({ 'x', 'o' }, 'ig', ':<C-U>Gitsigns select_hunk<CR>', 'inner git hunk')

    mapdata.gitsigns = {
      { '<leader>g', group = 'Git' },
      { '<leader>gc', group = 'Conflict' },
    }
  end,
}
