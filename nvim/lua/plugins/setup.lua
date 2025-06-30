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
  { 'akinsho/git-conflict.nvim', config = true,               event = 'VimEnter' }, -- conflicts highlighter
  { 'lewis6991/gitsigns.nvim',   config = config 'git.signs', event = 'VeryLazy' }, -- diff signs
  -- { 'sindrets/diffview.nvim' },
  -- endregion Git

  -- region: Bars
  { 'akinsho/nvim-bufferline.lua', config = config 'bars.tab_line',      event = 'VimEnter' }, -- tab-line
  { 'hoob3rt/lualine.nvim',        config = config 'bars.status_line',   event = 'VimEnter' }, -- status-line
  { 'luukvbaal/statuscol.nvim',    config = config 'bars.status_column', event = 'VimEnter' }, -- status-column
  -- endregion: Bars

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
      'windwp/nvim-ts-autotag',                      -- auto close tag
      'HiPhish/rainbow-delimiters.nvim',             -- rainbow colors
      'nvim-treesitter/nvim-treesitter-context',     -- sticky context
      'JoosepAlviste/nvim-ts-context-commentstring', -- commentstring based on location
    },
  },
  { -- folding
    'kevinhwang91/nvim-ufo',
    config = true,
    event = 'VeryLazy',
    dependencies = { 'kevinhwang91/promise-async' },
  },
  { -- better cmdline/popupmenu
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
  { -- indent line
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = config 'ui.indent_blankline',
    event = 'VeryLazy',
  },
  { 'tzachar/highlight-undo.nvim',        config = true },                                             -- highlight undo
  { 'stevearc/dressing.nvim',             event = 'VeryLazy' },                                        -- automatic set vim.ui interfaces
  { 'rcarriga/nvim-notify',               config = config 'ui.notify' },                               -- fancy notifications
  { 'goolord/alpha-nvim',                 config = config 'ui.landing' },                              -- start page
  { 'MeanderingProgrammer/markdown.nvim', config = config 'ui.markdown' },                             -- markdown preview
  { 'folke/which-key.nvim',               config = config 'ui.which_key' },                            -- which key helper
  { 'akinsho/nvim-toggleterm.lua',        config = config 'ui.toggleterm', },                          -- toggle terminal
  { 'NvChad/nvim-colorizer.lua',          config = config 'ui.nvim-colorizer' },                       -- color highlighter
  { 'folke/zen-mode.nvim',                config = config 'ui.zen_mode',         lazy = true },        -- zen mode
  { 'rmagatti/goto-preview',              config = config 'ui.goto-preview',     lazy = true },        -- go-to preview
  { 'RRethy/vim-illuminate',              config = config 'ui.word_highlight',   event = 'VeryLazy' }, -- cursor word highlight
  -- endregion: UI

  -- region: LSP
  { -- server installer
    'williamboman/mason.nvim',
    config = config 'lsp',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'onsails/lspkind-nvim',
      { 'folke/lazydev.nvim', ft = "lua", opts = { library = { 'luvit-meta/library' } } },
      { "Bilal2453/luvit-meta", lazy = true }
    },
  },
  { -- completions
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = config 'lsp.cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',             -- snippets (handler)
      'rafamadriz/friendly-snippets', -- snippets (common list)
      'saadparwaiz1/cmp_luasnip',     -- snippets (integration)
      'hrsh7th/cmp-buffer',           -- buffer words
      'hrsh7th/cmp-path',             -- path
      'hrsh7th/cmp-nvim-lsp',         -- lsp
    },
  },
  { -- debugging
    'mfussenegger/nvim-dap',
    lazy = true,
    config = config 'lsp.dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',        -- ui tool
      'mxsdev/nvim-dap-vscode-js',   -- JS debugger
    },
  },
  { -- typescript utils
    'pmizio/typescript-tools.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  { -- code completion
    'supermaven-inc/supermaven-nvim',
    config = {
      keymaps = {
        accept_suggestion = '<C-l>',
      },
    },
  },
  { 'b0o/schemastore.nvim',      lazy = true },                     -- json schemas
  { 'stevearc/conform.nvim',     config = config 'lsp.conform' },   -- formatting
  { 'mfussenegger/nvim-lint',    config = config 'lsp.nvim-lint' }, -- linting
  -- endregion: LSP

  -- region: Extra
  'Darazaki/indent-o-matic',                                                                                 -- auto set indentation width
  { 'axelvc/unito.nvim',             lazy = true },                                                          -- convert px to rem and vice-versa
  { 'nvim-lua/plenary.nvim',         lazy = true },                                                          -- lots of utility functions
  { 'kyazdani42/nvim-web-devicons',  lazy = true },                                                          -- nerd-font icons
  { 'ggandor/leap.nvim',             lazy = true },
  { 'nacro90/numb.nvim',             config = true },                                                        -- preview line on :[number]
  { 'jghauser/mkdir.nvim',           event = 'VeryLazy' },                                                   -- create directory on save
  { 'echasnovski/mini.nvim',         config = config 'utils.mini' },                                         -- lots of mini plugins
  { 'axelvc/template-string.nvim',   config = config 'utils.template_string' },                              -- JS quotes to template strings
  { 'Wansmer/treesj',                config = config 'utils.treesj',         lazy = true },                  -- split/join objects
  { 'numToStr/Comment.nvim',         config = config 'utils.comment',        event = 'VeryLazy' },           -- easy comment lines
  { 'windwp/nvim-autopairs',         config = config 'utils.autopairs',      event = 'VeryLazy' },           -- autopairs
  { 'kylechui/nvim-surround',        config = config 'utils.surround',       event = 'VeryLazy' },           -- selection pairs
  { 'danymat/neogen',                config = config 'utils.neogen',         cmd = { 'Neogen', 'Docgen' } }, -- documentation generator
  -- endregion: Extra
}
