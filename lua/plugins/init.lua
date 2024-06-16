return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",
        "bash-language-server",
        -- GO
        "gofumpt",
        "goimports",
        "golines",
        "gopls",
        -- Docker
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hadolint",
        -- Python
        "black",
        "isort",
        "pyright",
        -- TS
        "prettier",
        "eslint-lsp",
        "prisma-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        -- Terraform
        "terraform-ls",
        -- PHP
        "phpactor",
        "pint",
        "phpstan",
      },
    },
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "php",

        --yaml
        "yaml",
        -- terraform
        --"terraorm",
        --docker
        "dockerfile",
        -- low level
        "c",
        "zig",
        "go",
      },
    },
  },
  --
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist" },
    config = function()
      require "custom.configs.truezen" -- just an example path
    end,
  },
  --
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        delete = { text = "󰍵" },
        change = { text = "│" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
    },
  },
  --
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true,
      max_line = 1,
      line_numbers = true,
      mode = "topline",
    },
  },
  --
  { "folke/nvim-ts-autotag", config = true },
  --
  { "j-hui/fidget.nvim", config = true },
  --
  {
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "neotest" }, types = true },
    },
  },
  --
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration
      "ibhagwan/fzf-lua", -- optional
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
  --
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "V13Axel/neotest-pest",
      "marilari88/neotest-vitest",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
        ["neotest-python"] = {},
        ["neotest-pest"] = {},
        ["neotest-go"] = {},
        ["neotest-jest"] = {},
      },
    },
    keys = {
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
      },
    },
  },
  --
  {
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        lsp = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
          signature = {
            enabled = false,
          },
          hover = {
            enabled = false,
          },
        },
      },
      dependencies = {
        "MunifTanjim/nui.nvim",
        { "rcarriga/nvim-notify", opts = { render = "minimal" } },
      },
    },
  },
  --
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
     return require "configs.dashboard"
    end,
    config = function(_, opts)
      require("dashboard").setup(opts)
    end,
  },
  --
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    event = { "VeryLazy" },
    config = true,
  },
  --
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.lint"
    end,
  },
  --
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  --
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
}
