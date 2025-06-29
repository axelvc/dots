local o = vim.opt
local g = vim.g

g.mapleader = ' '
g.border = 'rounded'

g.signs = {
  error = '󰅚 ',
  warn = ' ',
  info = ' ',
  hint = '󰙎 ',
  debug = ' ',
}

-- misc
o.hidden = true
o.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
o.clipboard = 'unnamedplus'

-- ui
o.cmdheight = 1
o.foldcolumn = '1'
o.mouse = 'a'
o.scrolloff = 5
o.signcolumn = 'yes:2'
o.splitbelow = true
o.splitkeep = 'screen'
o.splitright = true
o.pumheight = 15
o.list = true
-- o.winborder = 'rounded'
o.listchars = {
  tab = '· ',
  eol = '~',
  -- space = '·',
}
o.fillchars = {
  eob = ' ',
  stl = ' ',
  stlnc = ' ',
  diff = ' ',
  fold = ' ',
  foldopen = '',
  foldclose = '',
  foldsep = ' ',
}

-- wrapping
o.wrap = false
o.breakindent = true
o.linebreak = true
o.showbreak = '››› '

-- folding
o.foldlevel = 20
o.foldenable = true

-- indention
o.autoindent = true
o.smartindent = true
o.expandtab = true

-- search
o.ignorecase = true
o.smartcase = true

-- tabs
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

-- cursor info
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = { 'both' }
o.guicursor = { 'a:blinkwait700-blinkoff750-blinkon250', 'i:ver20', 'r-o:hor20', 'v:block' }

-- window title
o.title = true
local root_dir = vim.fn.expand('%:p:h:t') -- convert "foo/bar/etc" into "etc"
o.titlestring = (' %s'):format(root_dir)

-- performance
o.timeoutlen = 400
o.updatetime = 0
o.swapfile = false

vim.filetype.add {
  extension = {
    czrc = 'json',
    zimrc = 'zsh',
    mdx = 'mdx',
  },
  pattern = {
    ['[jt]sconfig.json'] = 'jsonc',
    ['%.env%..*'] = 'sh',
  },
}

-- `clipboard.vim` file is too slow (compared with manual setting clipboard)
if has 'wsl' then
  vim.g.clipboard = {
    name = 'WslClipboard',
    cache_enabled = 0,
    copy = {
      -- ['+'] = 'clip.exe',
      -- ['*'] = 'clip.exe',
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      -- ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))',
      -- ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))',
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
  }
end

vim.cmd([[let &t_Cs = "\e[60m"]]) -- Inform vim how to enable undercurl in wezterm
vim.cmd([[let &t_Ce = "\e[24m"]]) -- Inform vim how to disable undercurl in wezterm (this disables all underline modes)
