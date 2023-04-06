---@param name string
local function config(name)
  return function()
    require('plugins.config.' .. name)
  end
end

return {
  -- [[ Core ]] --------------------------------------------------------------------
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' }, -- mesure startup-time
  { 'kyazdani42/nvim-web-devicons', lazy = true }, -- icons
  { 'nvim-lua/plenary.nvim', lazy = true }, -- utility functions used by lots of plugins
  { 'MunifTanjim/nui.nvim', lazy = true }, -- ui component library
  { 'kevinhwang91/promise-async', lazy = true }, -- promise like (js) functions

  -- [[ UI ]] -----------------------------------------------------------------------
  { 'catppuccin/nvim', config = config 'themes.catppuccin', name = 'catppuccin' },
  { 'olimorris/onedarkpro.nvim', config = config 'themes.onedarkpro', lazy = true },
  { 'marko-cerovac/material.nvim', config = config 'themes.material', lazy = true },
  { 'rose-pine/neovim', config = config 'themes.rose_pine', lazy = true },

  -- telescope
  {
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
      'JoosepAlviste/nvim-ts-context-commentstring', -- commentstring based on location
      'nvim-treesitter/playground', -- playground -- NOTE: maybe no longer needed (see :Inspect and vim.treesitter.show_tree())
      'windwp/nvim-ts-autotag', -- auto close tag
      'mrjones2014/nvim-ts-rainbow', -- rainbow colors
    },
  },

  -- git
  -- 'sindrets/diffview.nvim',
  { 'lewis6991/gitsigns.nvim', config = config 'gitsigns', event = 'VeryLazy' },
  { 'akinsho/git-conflict.nvim', config = true, event = 'VimEnter' },

  -- bars
  { 'akinsho/nvim-bufferline.lua', config = config 'bufferline', event = 'VimEnter' }, -- tabline
  { 'hoob3rt/lualine.nvim', config = config 'lualine', event = 'VimEnter' }, -- statusline

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
  { 'folke/noice.nvim', config = config 'noice' }, -- fancy messages,cmdline and popupmenu
  { 'stevearc/dressing.nvim', event = 'VeryLazy' }, -- automatic set vim.ui interfaces
  { 'goolord/alpha-nvim', config = config 'alpha' }, -- start page
  { 'rcarriga/nvim-notify', config = config 'notify' }, -- fancy notifications
  { 'folke/todo-comments.nvim', config = config 'todo_comments' }, -- highlight "todo" comments
  { 'folke/trouble.nvim', config = config 'trouble', lazy = true }, -- pretty diagnostics
  { 'folke/which-key.nvim', config = config 'which_key', event = 'VeryLazy' }, -- which key helper
  { 'kevinhwang91/nvim-ufo', config = true, event = 'VeryLazy' }, -- better fold
  { 'brenoprata10/nvim-highlight-colors', config = config 'highlight-colors' }, -- color highlighter
  { 'lukas-reineke/indent-blankline.nvim', config = config 'indent_blankline', event = 'VeryLazy' }, -- indent line
  { 'RRethy/vim-illuminate', config = config 'illuminate', event = 'VeryLazy' }, -- cursor word highlight

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
  { -- convert px to rem and vice versa
    'axelvc/unito.nvim',
    lazy = true,
  },
  { -- preview line on :[number]
    'nacro90/numb.nvim',
    config = true,
    keys = { ':' },
  },
  {
    'Wansmer/treesj',
    config = config 'treesj',
    lazy = true,
  },
  { -- documetation generator
    'danymat/neogen',
    config = config 'neogen',
    cmd = { 'Neogen', 'Docgen' },
  },
  'Darazaki/indent-o-matic', -- auto set indentation width
  { 'folke/neoconf.nvim', config = true },
  { 'jghauser/mkdir.nvim', event = 'VeryLazy' }, -- create directory on save
  { 'echasnovski/mini.nvim', config = config 'mini' }, -- lots of utils
  { 'axelvc/template-string.nvim', config = config 'template_string' }, -- JS quotes to template strings
  { 'rmagatti/goto-preview', config = config 'goto-preview', lazy = true }, -- goto preview
  { 'numToStr/Comment.nvim', config = config 'comment', event = 'VeryLazy' }, -- easy comment lines
  { 'windwp/nvim-autopairs', config = config 'autopairs', event = 'VeryLazy' }, -- autopairs
  { 'kylechui/nvim-surround', config = config 'surround', event = 'VeryLazy' }, -- selection pairs
}
