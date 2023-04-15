---@param name string
local function config(name)
  return function()
    require('plugins.config.' .. name)
  end
end

return {
  -- [[ Core ]] --------------------------------------------------------------------
  { 'MunifTanjim/nui.nvim', lazy = true }, -- ui component library
  { 'nvim-lua/plenary.nvim', lazy = true }, -- utility functions used by lots of plugins
  { 'kevinhwang91/promise-async', lazy = true }, -- promise like (js) functions
  { 'kyazdani42/nvim-web-devicons', lazy = true }, -- icons

  -- [[ UI ]] -----------------------------------------------------------------------
  { 'catppuccin/nvim', config = config 'themes.catppuccin', name = 'catppuccin' },
  { 'olimorris/onedarkpro.nvim', config = config 'themes.onedarkpro', lazy = true },
  { 'marko-cerovac/material.nvim', config = config 'themes.material', lazy = true },
  { 'rose-pine/neovim', config = config 'themes.rose_pine', lazy = true },

  { -- telescope
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = { 'Telescope' },
    config = config 'telescope',
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  { -- treesitter
    'nvim-treesitter/nvim-treesitter',
    config = config 'treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag', -- auto close tag
      'mrjones2014/nvim-ts-rainbow', -- rainbow colors
      'nvim-treesitter/nvim-treesitter-context', -- sticky context
      'JoosepAlviste/nvim-ts-context-commentstring', -- commentstring based on location
    },
  },

  -- git
  -- 'sindrets/diffview.nvim',
  { 'akinsho/git-conflict.nvim', config = true, event = 'VimEnter' },
  { 'lewis6991/gitsigns.nvim', config = config 'gitsigns', event = 'VeryLazy' },

  -- bars
  { 'hoob3rt/lualine.nvim', config = config 'lualine', event = 'VimEnter' }, -- statusline
  { "luukvbaal/statuscol.nvim", config = config 'statuscol', event = 'VimEnter' }, -- status-column
  { 'akinsho/nvim-bufferline.lua', config = config 'bufferline', event = 'VimEnter' }, -- tabline

  -- extra
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = config 'neo-tree',
    cmd = { 'Neotree' },
  },
  {
    'folke/zen-mode.nvim',
    config = config 'zen_mode',
    lazy = true,
  },
  { -- toggle terminal
    'akinsho/nvim-toggleterm.lua',
    config = config 'toggleterm',
    lazy = true,
    keys = { '<C-Bslash>' },
  },
  { -- pretty diagnostics
    'folke/trouble.nvim',
    config = config 'trouble',
    lazy = true,
  },
  { -- which key helper
    'folke/which-key.nvim',
    config = config 'which_key',
    lazy = true,
  },
  { -- better fold
    'kevinhwang91/nvim-ufo',
    config = true,
    event = 'VeryLazy',
  },
  { 'folke/noice.nvim', config = config 'noice' }, -- fancy messages,cmdline and popupmenu
  { 'stevearc/dressing.nvim', event = 'VeryLazy' }, -- automatic set vim.ui interfaces
  { 'goolord/alpha-nvim', config = config 'alpha' }, -- start page
  { 'rcarriga/nvim-notify', config = config 'notify' }, -- fancy notifications
  { 'folke/todo-comments.nvim', config = config 'todo_comments' }, -- highlight "todo" comments
  { 'NvChad/nvim-colorizer.lua', config = config 'nvim-colorizer' }, -- color highlighter
  { 'RRethy/vim-illuminate', config = config 'illuminate', event = 'VeryLazy' }, -- cursor word highlight
  { 'lukas-reineke/indent-blankline.nvim', config = config 'indent_blankline', event = 'VeryLazy' }, -- indent line

  -- [[ LSP ]] ----------------------------------------------------------------------
  {
    'williamboman/mason.nvim',
    config = config 'lsp',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'onsails/lspkind-nvim',
      'folke/neodev.nvim',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = config 'lsp.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
    },
  },
  { 'b0o/schemastore.nvim', lazy = true }, -- json schemas
  { 'simrat39/rust-tools.nvim', lazy = true }, -- rust lsp utils
  { 'jose-elias-alvarez/typescript.nvim', lazy = true }, -- typescript lsp utils
  { 'jose-elias-alvarez/null-ls.nvim', config = config 'lsp.null-ls' }, -- linter & formatter

  -- [[ Utils ]] --------------------------------------------------------------------
  { -- copilot alternative
    'Exafunction/codeium.vim',
    config = config 'codeium',
  },
  { -- convert px to rem and vice-versa
    'axelvc/unito.nvim',
    lazy = true,
  },
  { -- preview line on :[number]
    'nacro90/numb.nvim',
    config = true,
    keys = { ':' },
  },
  { -- split/join objects
    'Wansmer/treesj',
    config = config 'treesj',
    lazy = true,
  },
  { -- documetation generator
    'danymat/neogen',
    config = config 'neogen',
    cmd = { 'Neogen', 'Docgen' },
  },
  { -- goto preview
    'rmagatti/goto-preview',
    config = config 'goto-preview',
    lazy = true,
  },
  'Darazaki/indent-o-matic', -- auto set indentation width
  { 'jghauser/mkdir.nvim', event = 'VeryLazy' }, -- create directory on save
  { 'echasnovski/mini.nvim', config = config 'mini' }, -- lots of utils
  { 'axelvc/template-string.nvim', config = config 'template_string' }, -- JS quotes to template strings
  { 'numToStr/Comment.nvim', config = config 'comment', event = 'VeryLazy' }, -- easy comment lines
  { 'windwp/nvim-autopairs', config = config 'autopairs', event = 'VeryLazy' }, -- autopairs
  { 'kylechui/nvim-surround', config = config 'surround', event = 'VeryLazy' }, -- selection pairs
}
