return {
  { "nvim-lua/plenary.nvim", },
  { 'tpope/vim-sleuth',      lazy = false },

  {
    "rose-pine/neovim",
    priority = 1000,
    lazy = false,
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        styles = {
          italic = false,
          transparency = true,
        },
      })
      vim.cmd.colorscheme("rose-pine")

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    end
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "fredrikaverpil/neotest-golang",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec",
      "V13Axel/neotest-pest",
      "marilari88/neotest-vitest",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      require "config.neotest"
    end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,

  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {
      max_concurrent_installers = 10,
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { 'L3MON4D3/LuaSnip',            build = "make install_jsregexp" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      {
        "petertriho/cmp-git",
        opts = {
          filetypes = {
            "gitcommit",
            "octo",
            "git_rebase",
            "NeogitCommitMessage",
          },
        },
      },
    },
    config = function()
      require 'config.cmp'
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      require "config.lsp"
    end
  },

  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
          max_lines = 2,
        },
      }
    },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require "config.treesitter"
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    tag = '0.1.8',
    opts = {}
  },

  {
    "folke/trouble.nvim",
    opts = {}
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = { "tpope/vim-dadbod", cmd = "DB" },
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },
    init = function()
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_execute_on_save = false
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    keys = {
      {
        "<leader>gs",
        function()
          require("neogit").open()
        end,
      },
    },
    config = true,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufNewfile", "BufReadPre" },
    opts = {},
  },

  { "akinsho/git-conflict.nvim", version = "*", opts = {} },

  {
    'brenoprata10/nvim-highlight-colors',
    cmd = "HighlightColors",
    opts = {}
  },

  {
    "folke/zen-mode.nvim",
    dependencies = {
      { "folke/twilight.nvim", opts = {} }
    },
    opts = {}
  },

  {
    'pwntester/octo.nvim',
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- OR 'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = true,
      default_merge_method = "squash",
      picker = "telescope",
    }
  },

}
