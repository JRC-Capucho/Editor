return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User FilePost",
    opts = {
      max_lines = 2,
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "petertriho/cmp-git", opts = {} },
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {},
      },
    },
    opts = function()
      local conf = require "nvchad.configs.cmp"
      local cmp = require "cmp"

      conf.mapping = cmp.mapping.preset.insert {
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item { behavior = "insert" }
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item { behavior = "insert" }
          else
            cmp.complete()
          end
        end),
        ["<C-e>"] = cmp.mapping.abort(),
      }

      table.insert(conf.sources, { name = "git" })
      table.insert(conf.sources, { name = "vim-dadbod-completion" })
      table.insert(conf.sources, { name = "codeium", group_index = 1, priorty = 100 })

      return conf
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "css",
        "http",
        "dart",
        "graphql",
        "jsonc",
        "json",
        "vim",
        "sql",
        "vimdoc",
        "jsdoc",
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
        "markdown",
        "markdown_inline",
        "html",
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
}
