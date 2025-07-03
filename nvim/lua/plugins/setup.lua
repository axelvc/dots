---@param name string
local function config(name)
  return function()
    require('plugins.' .. name)
  end
end

return {
  -- region: Themes
  { 'catppuccin/nvim', config = config 'themes.catppuccin', name = 'catppuccin', lazy = false },
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
      'HiPhish/rainbow-delimiters.nvim',
      'nvim-treesitter/nvim-treesitter-context',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  { -- folding
    'kevinhwang91/nvim-ufo',
    config = true,
    event = 'User LspSetup',
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
    cmd = { 'Neotree' },
    config = config 'ui.file_explorer',
    dependencies = {
      { 's1n7ax/nvim-window-picker', version = '2.*', lazy = true }
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
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
      'onsails/lspkind-nvim',
      { 'folke/lazydev.nvim',   ft = "lua", opts = { library = { 'luvit-meta/library' } } },
      { "Bilal2453/luvit-meta", lazy = true }
    },
  },
  { -- completions
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = config 'lsp.completions',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    },
  },
  { -- debugging
    'mfussenegger/nvim-dap',
    lazy = true,
    config = config 'lsp.debugging',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',
      'mxsdev/nvim-dap-vscode-js',
    },
  },
  { -- TypeScript utils
    'pmizio/typescript-tools.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  { 'b0o/schemastore.nvim',           lazy = true },
  { 'supermaven-inc/supermaven-nvim', lazy = true },
  { 'stevearc/conform.nvim',          config = config 'lsp.formatting' },
  { 'mfussenegger/nvim-lint',         config = config 'lsp.linting' },
  -- endregion: LSP

  -- region: Utils
  'Darazaki/indent-o-matic',                                        -- auto set indentation width
  { 'ggandor/leap.nvim',            lazy = true },                  -- jump to search match
  { 'axelvc/unito.nvim',            lazy = true },                  -- px to rem and vice-versa
  { 'nvim-lua/plenary.nvim',        lazy = true },                  -- utility functions
  { 'kyazdani42/nvim-web-devicons', lazy = true },                  -- nerd-font icons
  { 'nacro90/numb.nvim',            config = true },                -- preview line on :[number]
  { 'jghauser/mkdir.nvim',          event = 'BufWritePre' },        -- create directory on save
  { 'echasnovski/mini.nvim',        config = config 'utils.mini' }, -- lots of mini plugins
  { 'axelvc/template-string.nvim',  config = config 'utils.template_string' },
  { 'Wansmer/treesj',               config = config 'utils.split_join',     lazy = true },
  { 'numToStr/Comment.nvim',        config = config 'utils.comments',       event = 'VeryLazy' },
  { 'windwp/nvim-autopairs',        config = config 'utils.autopairs',      event = 'VeryLazy' },
  { 'kylechui/nvim-surround',       config = config 'utils.pairs',          event = 'VeryLazy' },
  { 'danymat/neogen',               config = config 'utils.documentation',  cmd = { 'Neogen', 'Docgen' } },
  -- endregion: Utils
}
