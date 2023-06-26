-- setup diagnostic signs
-- for sign, icon in pairs(vim.g.signs) do
--   local hl = 'DiagnosticSign' .. sign:gsub('^%l', string.upper)

--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

local function filter_diagnostics(diagnostics)
  if not diagnostics then
    return {}
  end

  -- find the "worst" diagnostic per line
  local most_severe = {}
  for _, cur in pairs(diagnostics) do
    local max = most_severe[cur.lnum]

    -- higher severity has lower value (`:h diagnostic-severity`)
    if not max or cur.severity < max.severity then
      most_severe[cur.lnum] = cur
    end
  end

  return vim.tbl_values(most_severe)
end

-- reference to the original handler
local orig_signs_handler = vim.diagnostic.handlers.signs

-- Overriden diagnostics signs helper to only show the single most relevant sign
vim.diagnostic.handlers.signs = {
  show = function(ns, bufnr, diagnostics, opts)
    local filtered_diagnostics = filter_diagnostics(diagnostics)

    -- pass the filtered diagnostics (with the custom namespace) to the original handler
    orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
  end,
  hide = orig_signs_handler.hide,
}

vim.diagnostic.config {
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = {
    spacing = 0,
    prefix = ' ',
    format = function(diagnostic)
      if diagnostic.message:match 'Merge conflict' then
        return
      end

      return ('%s:%s - %s'):format(diagnostic.lnum + 1, diagnostic.col, diagnostic.message)
    end,
    severity = vim.diagnostic.severity.ERROR,
  },
  float = {
    source = false,
    border = vim.g.border,
    format = function(diagnostic)
      if diagnostic.source == 'typescript' then
        diagnostic.source = 'ts'
      end

      return ('[%s] %s:%s - %s'):format(diagnostic.source, diagnostic.lnum + 1, diagnostic.col, diagnostic.message)
    end,
  },
}
