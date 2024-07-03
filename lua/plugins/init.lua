return {
  { 'nvim-lua/plenary.nvim' },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",
        "jsdoc",

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
        "terraform",
        --docker
        "dockerfile",
        -- low level
        "c",
        "zig",
        "go",
        "regex",
        "bash",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    config = true,
    init = function()
      require 'configs.telescope'
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon",
      styles = {
        transparency = true,
      },
    },
    config = function(_, opts)
      require('rose-pine').setup(opts)
      vim.cmd.colorscheme('rose-pine-moon')
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'williamboman/mason.nvim',          config = true },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
      { "onsails/lspkind.nvim" },
    },
    config = function()
      require "configs.lsp"
    end
  },
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
    config = function()
      require "configs.neotest"
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      require 'configs.fugitive'
    end
  },
  {
    'Exafunction/codeium.vim',
    config = function()
      require 'configs.codium'
    end
  }
}
