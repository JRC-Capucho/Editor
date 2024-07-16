return {
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "json",
        "vim",
        "sql",
        "lua",
        "vimdoc",
        "jsdoc",
        "gitcommit",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "yaml",
        "terraform",
        "hcl",
        "dockerfile",
        "c",
        "zig",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "regex",
        "bash",
        "ruby",
        "python",
        "ninja",
        "rst",
        "prisma",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = true,
    init = function()
      require "configs.telescope"
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd.colorscheme "rose-pine"
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      -- vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/nvim-cmp" },
      { "j-hui/fidget.nvim", opts = {} },
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      { "kristijanhusak/vim-dadbod-completion" },
      { "petertriho/cmp-git", opts = {} },
      { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
    },
    config = function()
      require "configs.lsp"
      require "configs.cmp"
    end,
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
      require "configs.neotest"
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      require "configs.fugitive"
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    config = function()
      require "configs.trouble"
    end,
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
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofumpt" },
        php = { "pint" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
        terraform = { "terraform_validate" },
        tf = { "terraform_validate" },
      },
    },
  },
  {
    "Exafunction/codeium.nvim",
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "letieu/harpoon-lualine",
      "arkav/lualine-lsp-progress",
    },
    config = function()
      require "configs.lualine"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
      require "configs.harpoon"
    end,
  },
}
