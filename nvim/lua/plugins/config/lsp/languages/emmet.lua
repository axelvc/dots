local cmp = require 'cmp'

--- TODO: refactor this

local JS_CONFIG = {
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      entry_filter = function(entry, _)
        if entry.source:get_debug_name() == 'nvim_lsp:emmet_ls' then
          local node = require('nvim-treesitter.ts_utils').get_node_at_cursor()

          while node do
            if node:type() == 'jsx_element' then
              return true
            end

            node = node:parent()
          end

          return false
        end

        return true
      end,
    },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
}

local SVELTE_CONFIG = {
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      entry_filter = function(entry, ctx)
        if entry.source:get_debug_name() == 'nvim_lsp:emmet_ls' then
          local node = vim.treesitter.get_node_at_pos(ctx.bufnr, ctx.cursor.line, ctx.cursor.col, {})

          while node do
            if node:type() == 'script_element' then
              return false
            end

            node = node:parent()
          end

          return true
        end

        return true
      end,
    },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
}

local VUE_CONFIG = {
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      entry_filter = function(entry, ctx)
        if entry.source:get_debug_name() == 'nvim_lsp:emmet_ls' then
          local node = vim.treesitter.get_node_at_pos(ctx.bufnr, ctx.cursor.line, ctx.cursor.col, {})

          while node do
            if node:type() == 'script_element' then
              return false
            end

            node = node:parent()
          end

          return true
        end

        return true
      end,
    },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
}

local ASTRO_CONFIG = {
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      entry_filter = function(entry, ctx)
        if entry.source:get_debug_name() == 'nvim_lsp:emmet_ls' then
          local node = vim.treesitter.get_node_at_pos(ctx.bufnr, ctx.cursor.line, ctx.cursor.col, {})

          while node do
            if node:type() == 'frontmatter' then
              return false
            end

            node = node:parent()
          end

          return true
        end

        return true
      end,
    },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
}


cmp.setup.filetype('javascript', JS_CONFIG)
cmp.setup.filetype('typescriptreact', JS_CONFIG)
cmp.setup.filetype('svelte', SVELTE_CONFIG)
cmp.setup.filetype('vue', VUE_CONFIG)
cmp.setup.filetype('astro', ASTRO_CONFIG)

return {
  filetypes = {
    'css',
    'html',
    'javascript',
    'svelte',
    'typescriptreact',
    'vue',
    'astro',
  },
}
