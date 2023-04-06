local calculate_list = {
  'javascript',
  'javascriptreact',
  'typescriptreact',
}

---@param ctx CommentCtx
local function calculate_commentstring(ctx)
  if not vim.tbl_contains(calculate_list, vim.opt.filetype:get()) then
    return
  end

  local U = require 'Comment.utils'

  -- Determine whether to use linewise or blockwise commentstring
  local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

  -- Determine the location where to calculate commentstring from
  local location = nil
  if ctx.ctype == U.ctype.blockwise then
    location = require('ts_context_commentstring.utils').get_cursor_location()
  elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
    location = require('ts_context_commentstring.utils').get_visual_start_location()
  end

  return require('ts_context_commentstring.internal').calculate_commentstring {
    key = type,
    location = location,
  }
end

---@param ctx CommentCtx
local function set_cursor_position(ctx)
  local U = require 'Comment.utils'

  if ctx.ctype ~= U.ctype.linewise then
    return
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local location = require('ts_context_commentstring.utils').get_cursor_location()
  local comment = require('ts_context_commentstring.internal').calculate_commentstring { location = location }

  if not comment then
    comment = vim.opt.commentstring:get()

    if require('Comment.config'):get().padding then
      comment = comment .. ' '
    end
  end

  comment = comment:gsub('%%s', '')

  if ctx.cmode == U.cmode.comment then
    col = col + #comment
  else
    col = math.max(0, col - #comment)
  end

  vim.api.nvim_win_set_cursor(0, { row, col })
end

require('Comment').setup {
  ignore = '^$',
  pre_hook = calculate_commentstring,
  post_hook = set_cursor_position,
}
