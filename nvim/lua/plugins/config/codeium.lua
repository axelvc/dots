vim.g.codeium_no_map_tab = true
vim.g.codeium_filetypes = {
  ['TelescopePrompt'] = false,
  ['DressingInput'] = false,
}

map('i', '<C-l>', function()
  return vim.fn['codeium#Accept']()
end, { expr = true, silent = true })
