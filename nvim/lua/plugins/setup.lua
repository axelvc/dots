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
  { 'b0o/incline.nvim', config = true },
  { 'tzachar/highlight-undo.nvim',        config = true },
  { 'MeanderingProgrammer/markdown.nvim', config = config 'ui.markdown' },
  { 'folke/which-key.nvim',               config = config 'ui.which_key' },
  { 'catgoose/nvim-colorizer.lua',        config = config 'ui.color_highlight', event = 'VeryLazy' },
  { 'akinsho/nvim-bufferline.lua',        config = config 'ui.tab_line',        event = 'VimEnter', enabled = false },
  { 'hoob3rt/lualine.nvim',               config = config 'ui.status_line',     event = 'VimEnter' },
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
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    build = vim.fn.has("win32") ~= 0
        and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
        or 'make',
    version = false, -- Never set this value to '*'! Never!
    opts = {
      windows = {
        ask = {
          floating = true,
        },
      },
      instructions_file = 'agents.md',
      provider = 'codex',
      behaviour = {
        enable_fastapply = true, -- Enable Fast Apply feature
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
      'nvim-mini/mini.pick',           -- for file_selector provider mini.pick
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp',              -- autocompletion for avante commands and mentions
      'ibhagwan/fzf-lua',              -- for file_selector provider fzf
      'stevearc/dressing.nvim',        -- for input provider dressing
      'folke/snacks.nvim',             -- for input provider snacks
      'nvim-tree/nvim-web-devicons',   -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua',        -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
  },
  -- endregion: Utils
}
