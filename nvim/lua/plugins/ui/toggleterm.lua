require('toggleterm').setup {
  direction = 'float',
  open_mapping = '<C-Bslash>',
  size = 15,
}

vim.keymap.set(
  {'t', 'n'},
  '<leader>wh',
  function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local bufnr = vim.api.nvim_win_get_buf(win)
      if vim.bo[bufnr].buftype == 'terminal' then
        local _, term = require('toggleterm.terminal').identify(vim.api.nvim_buf_get_name(bufnr))
        if term and term:is_split() then
          return '<Cmd>ToggleTerm<CR><Cmd>ToggleTerm direction=float<CR>'
        end
      end
    end
    return '<Cmd>ToggleTerm direction=horizontal<CR>'
  end,
  {expr=true}
)
