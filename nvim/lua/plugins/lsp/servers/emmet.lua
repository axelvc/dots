local cmp = require 'cmp'

local function make_config(nodes, match_return)
  local tbl = {}

  for _, node in ipairs(nodes) do
    tbl[node] = true
  end

  return {
    sources = cmp.config.sources({
      {
        name = 'nvim_lsp',
        entry_filter = function(entry, _)
          if entry.source:get_debug_name() == 'nvim_lsp:emmet_ls' then
            local node = vim.treesitter.get_node()

            while node do
              if tbl[node:type()] then
                return match_return
              end

              node = node:parent()
            end

            return not match_return
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
end

local astro_config = make_config({ 'frontmatter' }, false)
local js_config = make_config({ 'jsx_element' }, true)
local svelte_config = make_config({ 'script_element' }, false)
local vue_config = make_config({ 'script_element' }, false)

cmp.setup.filetype('astro', astro_config)
cmp.setup.filetype('javascript', js_config)
cmp.setup.filetype('svelte', svelte_config)
cmp.setup.filetype('typescriptreact', js_config)
cmp.setup.filetype('vue', vue_config)
