---@param name string
local function config(name)
  return function()
    require('plugins.' .. name)
  end
end

return {
  -- region: Themes
  { 'catppuccin/nvim',             config = config 'themes.catppuccin',  name = 'catppuccin',  lazy = false },
  { 'loctvl842/monokai-pro.nvim',  config = config 'themes.monokai_pro', name = 'monokay_pro', lazy = true },
  -- endregion: Themes

  -- region: Git
  { 'akinsho/git-conflict.nvim',   config = true,                        event = 'VimEnter' }, -- conflits highlighter
  { 'lewis6991/gitsigns.nvim',     config = config 'git.gitsigns',       event = 'VeryLazy' }, -- diff signs
  -- endregion Git

  -- region: Bars
  { 'hoob3rt/lualine.nvim',        config = config 'bars.lualine',       event = 'VimEnter' }, -- statusline
  { 'luukvbaal/statuscol.nvim',    config = config 'bars.statuscol',     event = 'VimEnter' }, -- status-column
  { 'akinsho/nvim-bufferline.lua', config = config 'bars.bufferline',    event = 'VimEnter' }, -- tabline
  -- endregion: Bars

  -- region: UI
  { -- fzf-like finder
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = { 'Telescope' },
    config = config 'ui.telescope',
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  { -- treesitter (highlights)
    'nvim-treesitter/nvim-treesitter',
    config = config 'ui.treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',                      -- auto close tag
      'mrjones2014/nvim-ts-rainbow',                 -- rainbow colors
      'nvim-treesitter/nvim-treesitter-context',     -- sticky context
      'JoosepAlviste/nvim-ts-context-commentstring', -- commentstring based on location
    },
  },
  { -- improve folding
    'kevinhwang91/nvim-ufo',
    config = true,
    event = 'VeryLazy',
    dependencies = { 'kevinhwang91/promise-async' },
  },
  { -- fancy messages,cmdline and popupmenu
    'folke/noice.nvim',
    config = config 'ui.noice',
    dependencies = { 'MunifTanjim/nui.nvim' }
  },
  { 'stevearc/dressing.nvim',              event = 'VeryLazy' },                                         -- automatic set vim.ui interfaces
  { 'goolord/alpha-nvim',                  config = config 'ui.alpha' },                                 -- start page
  { 'rcarriga/nvim-notify',                config = config 'ui.notify' },                                -- fancy notifications
  { 'folke/which-key.nvim',                config = config 'ui.which_key' },                             -- which key helper
  { 'akinsho/nvim-toggleterm.lua',         config = config 'ui.toggleterm', },                           -- toggle terminal
  { 'folke/todo-comments.nvim',            config = config 'ui.todo_comments' },                         -- highlight "todo" comments
  { 'NvChad/nvim-colorizer.lua',           config = config 'ui.nvim-colorizer' },                        -- color highlighter
  { 'folke/zen-mode.nvim',                 config = config 'ui.zen_mode',         lazy = true },         -- zen mode
  { 'folke/trouble.nvim',                  config = config 'ui.trouble',          lazy = true },         -- pretty diagnostics
  { 'rmagatti/goto-preview',               config = config 'ui.goto-preview',     lazy = true },         -- goto preview
  { 'RRethy/vim-illuminate',               config = config 'ui.illuminate',       event = 'VeryLazy' },  -- cursor word highlight
  { 'lukas-reineke/indent-blankline.nvim', config = config 'ui.indent_blankline', event = 'VeryLazy' },  -- indent line
  { 'nvim-neo-tree/neo-tree.nvim',         config = config 'ui.neo-tree',         cmd = { 'Neotree' } }, -- sidebar explorer
  -- endregion: UI

  -- region LSP
  { -- server installer
    'williamboman/mason.nvim',
    config = config 'lsp',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'onsails/lspkind-nvim',
      'folke/neodev.nvim',
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
      'rcarriga/nvim-dap-ui',        -- ui tool
      'mxsdev/nvim-dap-vscode-js',   -- JS debugger
      {
        'microsoft/vscode-js-debug', -- JS dap server
        version = '1.x',
        build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
      },
    },
  },
  { 'b0o/schemastore.nvim',               lazy = true },                   -- json schemas
  { 'simrat39/rust-tools.nvim',           lazy = true },                   -- rust utils
  { 'jose-elias-alvarez/typescript.nvim', lazy = true },                   -- typescript utils
  { 'jose-elias-alvarez/null-ls.nvim',    config = config 'lsp.null-ls' }, -- linter & formatter
  { 'Exafunction/codeium.vim',            config = config 'lsp.codeium' }, -- copilot alternative
  -- endregion: LSP

  -- region: Extra
  'Darazaki/indent-o-matic',                                                                                -- auto set indentation width
  { 'axelvc/unito.nvim',            lazy = true },                                                          -- convert px to rem and vice-versa
  { 'nvim-lua/plenary.nvim',        lazy = true },                                                          -- lots of utility functions
  { 'kyazdani42/nvim-web-devicons', lazy = true },                                                          -- nerd-font icons
  { 'folke/flash.nvim',             config = true },                                                        -- motion movement
  { 'nacro90/numb.nvim',            config = true },                                                        -- preview line on :[number]
  { 'jghauser/mkdir.nvim',          event = 'VeryLazy' },                                                   -- create directory on save
  { 'echasnovski/mini.nvim',        config = config 'utils.mini' },                                         -- lots of mini plugins
  { 'axelvc/template-string.nvim',  config = config 'utils.template_string' },                              -- JS quotes to template strings
  { 'Wansmer/treesj',               config = config 'utils.treesj',         lazy = true },                  -- split/join objects
  { 'numToStr/Comment.nvim',        config = config 'utils.comment',        event = 'VeryLazy' },           -- easy comment lines
  { 'windwp/nvim-autopairs',        config = config 'utils.autopairs',      event = 'VeryLazy' },           -- autopairs
  { 'kylechui/nvim-surround',       config = config 'utils.surround',       event = 'VeryLazy' },           -- selection pairs
  { 'danymat/neogen',               config = config 'utils.neogen',         cmd = { 'Neogen', 'Docgen' } }, -- documentation generator
  -- endregion: Extra
}
