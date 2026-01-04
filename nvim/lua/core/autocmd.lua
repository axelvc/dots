local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt

local group = vim.api.nvim_create_augroup('Core', { clear = true })

autocmd('BufNew', {
  desc = 'Disable auto comment on newline',
  group = group,
  pattern = '*',
  callback = function()
    o.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

autocmd('BufEnter', {
  desc = 'Open help in vertical split',
  group = group,
  pattern = '*.txt',
  callback = function()
    if o.buftype:get() ~= 'help' or vim.b.opened then
      return
    end

    vim.cmd 'wincmd L'
    vim.b.opened = true

    autocmd('BufDelete', {
      desc = 'Cleanup for vertical help',
      group = group,
      once = true,
      buffer = 0,
      callback = function()
        vim.b.opened = false
      end,
    })
  end,
})

autocmd('VimResized', {
  desc = 'Resize splits when window is resized',
  group = group,
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

autocmd('CmdlineEnter', {
  desc = 'Disable smartcase in cmd',
  group = group,
  pattern = '*',
  callback = function()
    o.smartcase = false
  end,
})

autocmd('CmdlineLeave', {
  desc = 'Enable smartcase out of cmd',
  pattern = '*',
  group = group,
  callback = function()
    o.smartcase = true
  end,
})

autocmd('TermOpen', {
  desc = 'Start terminal in insert mode',
  group = group,
  pattern = '*',
  callback = function()
    vim.cmd 'startinsert'
  end,
})

autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = group,
  callback = function()
    vim.hl.on_yank { timeout = 200 }
  end,
})

autocmd('Filetype', {
  group = group,
  desc = 'Wrap text on text files',
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- local function has_dash_in_iskeyword(kw)
--   -- match a literal '-' token in comma-separated list
--   return kw:match("(^|,)%-(,|$)") ~= nil
-- end

-- local function add_dash_to_iskeyword(kw)
--   if has_dash_in_iskeyword(kw) then return kw end
--   if kw == "" then return "-" end
--   return kw .. ",-"
-- end

-- local function remove_dash_from_iskeyword(kw)
--   -- remove "-," or ",-" or standalone "-"
--   kw = kw:gsub("(^|,)%-(,|$)", function(a, b)
--     if a == "," and b == "," then return "," end
--     return ""
--   end)
--   kw = kw:gsub("^,", ""):gsub(",$", ""):gsub(",,+", ",")
--   return kw
-- end

-- local function node_is_tag_name(node)
--   while node do
--     local t = node:type()
--     if t == "tag_name" or t == "end_tag_name" then
--       return true
--     end
--     -- stop if we hit attribute/value nodes (optional)
--     if t == "attribute" or t == "attribute_value" or t == "quoted_attribute_value" then
--       return false
--     end
--     node = node:parent()
--   end
--   return false
-- end

-- local function update_iskeyword_dash()
--   local ok, node = pcall(vim.treesitter.get_node)
--   if not ok then return end

--   local kw = vim.opt_local.iskeyword:get()
--   local kw_str = table.concat(kw, ",")

--   local want_dash = node and node_is_tag_name(node) or false
--   local new_kw_str = want_dash and add_dash_to_iskeyword(kw_str) or remove_dash_from_iskeyword(kw_str)

--   if new_kw_str ~= kw_str then
--     vim.opt_local.iskeyword = vim.split(new_kw_str, ",", { plain = true })
--   end
-- end

-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "InsertEnter" }, {
--   pattern = { "*.html", "*.htm", "*.xml", "*.tsx", "*.jsx" },
--   callback = update_iskeyword_dash,
-- })
