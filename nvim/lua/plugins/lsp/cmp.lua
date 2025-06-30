local cmp = require 'cmp'
local luasnip = require 'luasnip'

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

-- load snippets
luasnip.filetype_extend('typescript', { 'javascript' })
luasnip.filetype_extend('typescriptreact', { 'javascriptreact' })
require('luasnip.loaders.from_vscode').lazy_load()

luasnip.config.setup {
  region_check_events = 'CursorHold',
}

cmp.setup {
  sources = cmp.config.sources({
    { name = 'supermaven' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
  window = {
    completion = cmp.config.window.bordered {
      border = vim.g.border,
      winhighlight = 'Normal:Pmenu,Search:None',
    },
    documentation = cmp.config.window.bordered {
      border = vim.g.border,
      winhighlight = 'Normal:Pmenu',
    },
  },
  completion = {
    completeopt = 'menu,menuone,noselect,noinsert',
  },
  formatting = {
    format = require('lspkind').cmp_format {
      mode = 'symbol',
      preset = 'codicons',
    },
    fields = { 'kind', 'abbr', 'menu' },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    -- open suggestions
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete {}, { 'i', 'c' }),
    -- close suggetions
    ['<C-q>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- confirm suggestion
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm { select = true }
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- scroll
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- select suggestion
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
  },
}
