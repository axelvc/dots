require('incline').setup {
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    local modified = vim.bo[props.buf].modified

    return {
      modified and { '  ', group = 'WarningMsg' } or '',
      ' ' .. filename .. ' ',
      group = modified and 'WarningMsg' or 'NormalFloat',
    }
  end
}
