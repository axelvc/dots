---@param name string
local function config(name)
  return function()
    require('plugins.' .. name)
  end
end

return {
  -- region: Themes
  { 'catppuccin/nvim', config = config 'themes.catppuccin', name = 'catppuccin', lazy = false },
  { 'embark-theme/vim', name = 'embark', lazy = false },
  { 'loctvl842/monokai-pro.nvim', name = 'monokai-pro', lazy = false },
  -- endregion: Themes

  -- region: Git
  { 'akinsho/git-conflict.nvim', config = true,               event = 'VimEnter' },
  { 'lewis6991/gitsigns.nvim',   config = config 'git.signs', event = 'VeryLazy' },
  -- { 'sindrets/diffview.nvim' },
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
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = true,
    event = 'VeryLazy',
  },
  { 'tzachar/highlight-undo.nvim',        config = true },
  { 'stevearc/dressing.nvim',             event = 'VeryLazy' },
  { 'goolord/alpha-nvim',                 config = config 'ui.landing' },
  { 'MeanderingProgrammer/markdown.nvim', config = config 'ui.markdown' },
  { 'akinsho/nvim-toggleterm.lua',        config = config 'ui.terminal' },
  { 'folke/which-key.nvim',               config = config 'ui.which_key' },
  { 'rcarriga/nvim-notify',               config = config 'ui.notifications' },
  { 'folke/zen-mode.nvim',                config = config 'ui.zen_mode',        lazy = true },
  { 'rmagatti/goto-preview',              config = config 'ui.goto_preview',    lazy = true },
  { 'NvChad/nvim-colorizer.lua',          config = config 'ui.color_highlight', event = 'VeryLazy' },
  { 'RRethy/vim-illuminate',              config = config 'ui.word_highlight',  event = 'VeryLazy' },
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
  { -- debugging
    'mfussenegger/nvim-dap',
    lazy = true,
    config = config 'lsp.debugging',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'igorlfs/nvim-dap-view',
      'mxsdev/nvim-dap-vscode-js',
    },
  },
  { 'b0o/schemastore.nvim',           lazy = true },
  { 'supermaven-inc/supermaven-nvim', lazy = true },
  { 'stevearc/conform.nvim',          config = config 'lsp.formatting' },
  { 'mfussenegger/nvim-lint',         config = config 'lsp.linting' },
  -- endregion: LSP

  -- region: Utils
  {
    'alex-popov-tech/store.nvim',
    dependencies = { 'OXY2DEV/markview.nvim' },
    cmd = 'Store',
    keys = {
      { '<leader>s', ':Store<cr>', desc = 'Open Plugin Store' },
    },
  },
  'Darazaki/indent-o-matic',                                        -- auto set indentation width
  { 'ggandor/leap.nvim',            lazy = true },                  -- jump to search match
  { 'axelvc/unito.nvim',            lazy = true },                  -- px to rem and vice-versa
  { 'nvim-lua/plenary.nvim',        lazy = true },                  -- utility functions
  { 'kyazdani42/nvim-web-devicons', lazy = true },                  -- nerd-font icons
  { 'nacro90/numb.nvim',            config = true },                -- preview line on :[number]
  { 'jghauser/mkdir.nvim',          event = 'BufWritePre' },        -- create directory on save
  { 'echasnovski/mini.nvim',        config = config 'utils.mini' }, -- lots of mini plugins
  { 'folke/snacks.nvim',            lazy = false, priority = 1000 },
  { 'axelvc/template-string.nvim',  config = config 'utils.template_string' },
  { 'Wansmer/treesj',               config = config 'utils.split_join',     lazy = true },
  { 'numToStr/Comment.nvim',        config = config 'utils.comments',       event = 'VeryLazy' },
  { 'windwp/nvim-autopairs',        config = config 'utils.autopairs',      event = 'VeryLazy' },
  { 'kylechui/nvim-surround',       config = config 'utils.pairs',          event = 'VeryLazy' },
  { 'danymat/neogen',               config = config 'utils.documentation',  cmd = { 'Neogen', 'Docgen' } },
  -- endregion: Utils
}
