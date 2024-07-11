return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
      },
    },
    config = function()
      require "configs.conform"
    end,
  },
  { "folke/which-key.nvim", enabled = false },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "bash-language-server",
        "black",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint-lsp",
        "goimports",
        "gofumpt",
        "gopls",
        "hadolint",
        "html-lsp",
        "phpactor",
        "isort",
        "json-lsp",
        "lua-language-server",
        "pint",
        "phpcs",
        "prisma-language-server",
        "ruff-lsp",
        "selene",
        "solargraph",
        "sqlfluff",
        "tailwindcss-language-server",
        "terraform-ls",
        "tflint",
        "vtsls",
        "yaml-language-server",
        "hadolint",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
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
    },
  },
  --
  {
    "hrsh7th/nvim-cmp",
    dependencies = "kristijanhusak/vim-dadbod-completion",
    opts = function()
      local conf = require 'nvchad.configs.cmp'
      local cmp = require 'cmp'

      conf.source = { name = "vim-dadbod-completion" }

      conf.mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<C-y>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },

        ["<C-s>;"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-s>,"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" }),
      }

      return conf
    end
  },
  {
    "nvim-neotest/neotest",
    keys = {
      { "<leader>,ts", function()
        require("neotest").summary.toggle()
      end }
    },
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
    "folke/trouble.nvim",
    opts = {},
    keys = {
      { "<leader>tt", function()
        require 'trouble'.open({ mode = "diagnostics" })
      end },
      {
        "[t", function()
        require 'trouble'.next({ skip_groups = true, jump = true })
      end

      },
      {
        "]t", function()
        require 'trouble'.prev({ skip_groups = true, jump = true })
      end
      }
    },
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
}
