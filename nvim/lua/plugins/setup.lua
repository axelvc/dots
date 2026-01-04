---@param name string
local function config(name)
  return function()
    require('plugins.' .. name)
  end
end

return {
  -- region: Themes
  { 'catppuccin/nvim',            name = 'catppuccin',         lazy = false,      config = config 'themes.catppuccin' },
  { 'WTFox/jellybeans.nvim',      name = 'jellybeans',         lazy = true },
  { 'embark-theme/vim',           name = 'embark',             lazy = true },
  { 'loctvl842/monokai-pro.nvim', name = 'monokai-pro',        lazy = true },
  -- endregion: Themes

  -- region: Git
  { 'akinsho/git-conflict.nvim',  config = true,               event = 'VimEnter' },
  { 'lewis6991/gitsigns.nvim',    config = config 'git.signs', event = 'VeryLazy' },
  -- endregion Git

  -- region: UI
  { -- highlights
    'nvim-treesitter/nvim-treesitter',
    config = config 'ui.highlight',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-context',
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'saghen/blink.pairs',
        dependencies = 'saghen/blink.download',
        version = '*',
      },
    },
  },
  { -- folding
    'kevinhwang91/nvim-ufo',
    config = true,
    dependencies = { 'kevinhwang91/promise-async' },
  },
  { -- cmdline
    'folke/noice.nvim',
    config = config 'ui.cmd_line',
    dependencies = { 'MunifTanjim/nui.nvim' }
  },
  { -- file explorer
    'nvim-neo-tree/neo-tree.nvim',
    lazy = true,
    branch = 'v3.x',
    cmd = { 'Neotree' },
    config = config 'ui.file_explorer',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
  },
  { 'MeanderingProgrammer/markdown.nvim', config = config 'ui.markdown' },
  { 'folke/which-key.nvim',               config = config 'ui.which_key' },
  { 'b0o/incline.nvim',                   config = config 'ui.file_popup' },
  { 'catgoose/nvim-colorizer.lua',        config = config 'ui.color_highlight' },
  { 'hoob3rt/lualine.nvim',               config = config 'ui.status_line',    event = 'VimEnter' },
  { 'tzachar/highlight-undo.nvim',        config = true,                       event = 'VimEnter' },
  -- endregion: UI

  -- region: LSP
  { -- servers installer
    'williamboman/mason.nvim',
    config = config 'lsp',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        dependencies = {
          { 'Bilal2453/luvit-meta',    lazy = true, vesion = false },
          { 'DrKJeff16/wezterm-types', lazy = true, version = false },
        },
        opts = {
          library = {
            'luvit-meta/library',
            { path = 'snacks.nvim',   words = { 'Snacks' } },
            { path = 'wezterm-types', mods = { 'wezterm' } },
          },
        },
      },
    },
  },
  { -- completions
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
      { 'L3MON4D3/LuaSnip', tag = 'v2.4.0', build = 'make install_jsregexp' }
    },
    version = '1.*',
    event = 'InsertEnter',
    config = config 'lsp.completions',
  },
  { 'b0o/schemastore.nvim',           lazy = true },
  { 'supermaven-inc/supermaven-nvim', lazy = true },
  { 'stevearc/conform.nvim',          config = config 'lsp.formatting' },
  { 'mfussenegger/nvim-lint',         config = config 'lsp.linting' },
  -- endregion: LSP

  -- region: Utils
  'Darazaki/indent-o-matic',                                 -- auto set indentation width
  { 'axelvc/unito.nvim',            lazy = true },           -- px to rem and vice-versa
  { 'nvim-lua/plenary.nvim',        lazy = true },           -- utility functions
  { 'kyazdani42/nvim-web-devicons', lazy = true },           -- nerd-font icons
  { 'nacro90/numb.nvim',            config = true },         -- preview line on :[number]
  { 'folke/flash.nvim',             event = 'VeryLazy' },    -- jump to search match
  { 'jghauser/mkdir.nvim',          event = 'BufWritePre' }, -- create directory on save
  { 'axelvc/template-string.nvim',  config = config 'utils.template_string' },
  { 'Wansmer/treesj',               config = config 'utils.split_join',      lazy = true },
  { 'echasnovski/mini.nvim',        config = config 'utils.mini',            event = 'VeryLazy' },
  { 'numToStr/Comment.nvim',        config = config 'utils.comments',        event = 'VeryLazy' },
  { 'kylechui/nvim-surround',       config = config 'utils.pairs',           event = 'VeryLazy' },
  { 'folke/snacks.nvim',            config = require 'plugins.utils.snacks', priority = 1000 },
  {
    'NickvanDyke/opencode.nvim',
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}
      vim.o.autoread = true
    end,
  }
}
