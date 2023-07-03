local gitsigns = require 'gitsigns'

local lazygit

gitsigns.setup {
  trouble = false,
  signs = {
    add = { text = '▎' },
    change = { text = '▎' },
    delete = { text = '▁' },
    topdelete = { text = '▔' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local function bmap(modes, keys, map, desc)
      vim.keymap.set(modes, keys, map, vim.tbl_extend('force', { desc = desc }, opts))
    end

    if not lazygit then
      lazygit = require('toggleterm.terminal').Terminal:new {
        cmd = 'lazygit',
        hidden = true,
      }
    end

    -- external
    bmap('n', '<leader>gg', ':Neotree toggle git_status<CR>', 'Neotree git')

    -- conflict
    bmap('n', '<leader>gcc', ':GitConflictChooseOurs<CR>', 'Current')
    bmap('n', '<leader>gci', ':GitConflictChooseTheirs<CR>', 'Incoming')
    bmap('n', '<leader>gcb', ':GitConflictChooseBoth<CR>', 'Both')
    bmap('n', '<leader>gcr', ':GitConflictChooseNone<CR>', 'Reset')

    bmap('n', '[c', ':GitConflictPrevConflict<CR>', 'Previuous git conflict')
    bmap('n', ']c', ':GitConflictNextConflict<CR>', 'Next git conflict')

    -- stylua: ignore
    bmap('n', '<Leader>gt', function() lazygit:toggle() end, 'Lazygit')

    -- navigation
    bmap('n', '[g', gitsigns.prev_hunk, 'Previus git hunk')
    bmap('n', ']g', gitsigns.next_hunk, 'Next git hunk')

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

    -- select inner hunk
    bmap({ 'x', 'o' }, 'ig', ':<C-U>Gitsigns select_hunk<CR>', 'inner git hunk')

    -- which key documentation
    local exists, wk = pcall(require, 'which-key')
    if exists then
      wk.register({
        ['<leader>g'] = { name = 'Git' },
        ['<leader>gc'] = { name = 'Conflict' },
      }, { buffer = bufnr })
    end
  end,
}
