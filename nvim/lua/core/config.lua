---@diagnostic disable: assign-type-mismatch
local o = vim.opt

-- misc
o.hidden = true
o.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
o.clipboard = 'unnamedplus'

-- ui
o.cmdheight = 1
o.fillchars = { eob = ' ', stl = ' ', stlnc = ' ', diff = '/', fold = ' ' }
o.mouse = 'a'
o.scrolloff = 5
o.signcolumn = 'yes:2'
o.splitbelow = true
o.splitkeep = 'screen'
o.splitright = true
o.termguicolors = true
o.pumheight = 15

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
o.titlestring = 'Vim - ' .. vim.fn.expand('%:p:h:t', nil)

-- performance
o.timeoutlen = 400
o.updatetime = 0
o.swapfile = false

vim.filetype.add {
  filename = {
    ['.czrc'] = 'json',
    ['.zimrc'] = 'zsh',
  },
  pattern = {
    ['[jt]sconfig.json'] = 'jsonc',
    ['%.env%..*'] = 'sh',
  },
}
