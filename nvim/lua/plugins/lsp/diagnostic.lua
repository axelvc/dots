local ns = vim.api.nvim_create_namespace('diagnostics-signs')
local orig_signs_handler = vim.diagnostic.handlers.signs

vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, _, opts)
    local diagnostics = vim.diagnostic.get(bufnr)

    local max_severity_per_line = {}
    for _, d in pairs(diagnostics) do
      local m = max_severity_per_line[d.lnum]
      if not m or d.severity < m.severity then
        max_severity_per_line[d.lnum] = d
      end
    end

    local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
    orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
  end,
  hide = function(_, bufnr)
    orig_signs_handler.hide(ns, bufnr)
  end,
}

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = vim.g.signs.error,
      [vim.diagnostic.severity.WARN] = vim.g.signs.warn,
      [vim.diagnostic.severity.INFO] = vim.g.signs.info,
      [vim.diagnostic.severity.HINT] = vim.g.signs.hint,
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
    },
  },
  update_in_insert = true,
  severity_sort = true,
  underline = true,
  virtual_text = {
    spacing = 0,
    prefix = vim.g.signs.debug,
    hl_mode = 'combine',
    format = function(diagnostic)
      if diagnostic.message:match 'Merge conflict' then
        return ''
      end

      return ('%s:%s - %s'):format(diagnostic.lnum + 1, diagnostic.col, diagnostic.message)
    end,
    severity = vim.diagnostic.severity.ERROR,
  },
  float = {
    source = false,
    -- border = vim.opt.winborder,
    format = function(diagnostic)
      if diagnostic.source == 'tsserver' then
        diagnostic.source = 'ts'
      end

      return ('[%s] %s:%s - %s'):format(diagnostic.source, diagnostic.lnum + 1, diagnostic.col, diagnostic.message)
    end,
  },
}
