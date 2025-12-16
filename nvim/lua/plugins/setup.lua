---@param name string
local function config(name)
  return function()
    require('plugins.' .. name)
  end
end

return {
  -- region: Themes
  { 'catppuccin/nvim',            name = 'catppuccin',         lazy = false,      config = config 'themes.catppuccin' },
  { 'embark-theme/vim',           name = 'embark',             lazy = true },
  { 'loctvl842/monokai-pro.nvim', name = 'monokai-pro',        lazy = true },
  -- endregion: Themes

  -- region: Git
  { 'akinsho/git-conflict.nvim',  config = true,               event = 'VimEnter' },
  { 'lewis6991/gitsigns.nvim',    config = config 'git.signs', event = 'VeryLazy' },
  -- endregion Git

  -- region: UI
  { -- finder
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = { 'Telescope' },
    config = config 'ui.finder',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
      }
    }
  },
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
  { 'tzachar/highlight-undo.nvim',        config = true },
  { 'MeanderingProgrammer/markdown.nvim', config = config 'ui.markdown' },
  { 'folke/which-key.nvim',               config = config 'ui.which_key' },
  { 'catgoose/nvim-colorizer.lua',        config = config 'ui.color_highlight', event = 'VeryLazy' },
  { 'akinsho/nvim-bufferline.lua',        config = config 'ui.tab_line',        event = 'VimEnter' },
  { 'hoob3rt/lualine.nvim',               config = config 'ui.status_line',     event = 'VimEnter' },
  { 'luukvbaal/statuscol.nvim',           config = config 'ui.status_column',   event = 'VimEnter' },
  -- endregion: UI

  -- region: LSP
  { -- servers installer
    'williamboman/mason.nvim',
    config = config 'lsp',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      { 'folke/lazydev.nvim',   ft = 'lua', opts = { library = { 'luvit-meta/library' } } },
      { 'Bilal2453/luvit-meta', lazy = true }
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
  { 'ggandor/leap.nvim',            lazy = true },           -- jump to search match
  { 'axelvc/unito.nvim',            lazy = true },           -- px to rem and vice-versa
  { 'nvim-lua/plenary.nvim',        lazy = true },           -- utility functions
  { 'kyazdani42/nvim-web-devicons', lazy = true },           -- nerd-font icons
  { 'nacro90/numb.nvim',            config = true },         -- preview line on :[number]
  { 'jghauser/mkdir.nvim',          event = 'BufWritePre' }, -- create directory on save
  { 'axelvc/template-string.nvim',  config = config 'utils.template_string' },
  { 'Wansmer/treesj',               config = config 'utils.split_join',      lazy = true },
  { 'echasnovski/mini.nvim',        config = config 'utils.mini',            event = 'VeryLazy' },
  { 'numToStr/Comment.nvim',        config = config 'utils.comments',        event = 'VeryLazy' },
  { 'kylechui/nvim-surround',       config = config 'utils.pairs',           event = 'VeryLazy' },
  { 'folke/snacks.nvim',            config = require 'plugins.utils.snacks', priority = 1000 },
  -- endregion: Utils
}
