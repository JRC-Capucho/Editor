return {

  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.test.core" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.git" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.php" },
  { import = "lazyvim.plugins.extras.lang.prisma" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.sql" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.terraform" },
  { import = "lazyvim.plugins.extras.lsp.neoconf" },
  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  { import = "lazyvim.plugins.extras.editor.inc-rename" },
  { import = "lazyvim.plugins.extras.lang.git" },
  { import = "lazyvim.plugins.extras.coding.codeium" },
  { import = "lazyvim.plugins.extras.test.core" },
  { import = "lazyvim.plugins.extras.util.octo" },
  { import = "lazyvim.plugins.extras.util.rest" },

  { "folke/flash.nvim", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },

  {
    "nvim-telescope/telescope.nvim",
    keys = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = false,
  },

  {
    "folke/trouble.nvim",
    keys = false,
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local config = require("config.cmp")

      opts.mapping = config.mapping

      ---@diagnostic disable-next-line: missing-fields

      opts.formatting = config.formatting

      opts.window = config.window
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("neogit").setup({})
    end,
  },

  {
    "petertriho/cmp-git",
    opts = {
      filetypes = { "gitcommit", "octo", "git_rebase", "NeogitCommitMessage" },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = require("config.dashboard")

      opts.config.header = vim.split(logo, "\n")
    end,
  },

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "gK", false }
      keys[#keys + 1] = { "gr", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<leader>cR", false }
      keys[#keys + 1] = { "[[", false }
      keys[#keys + 1] = { "]]", false }
      keys[#keys + 1] = { "<a-n>", false }
      keys[#keys + 1] = { "<a-p>", false }
      keys[#keys + 1] = { "<c-k>", false }
      -- add a keymap
      keys[#keys + 1] = {
        "<leader>vws",
        function()
          vim.lsp.buf.workspace_symbol()
        end,
      }
      keys[#keys + 1] = {
        "<leader>vd",
        function()
          vim.diagnostic.open_float({ border = "rounded" })
        end,
      }
      keys[#keys + 1] = {
        "gd",
        function()
          vim.lsp.buf.definition()
        end,
      }
      keys[#keys + 1] = {
        "K",
        function()
          vim.lsp.buf.hover()
        end,
      }
      keys[#keys + 1] = {
        "<leader>vws",
        function()
          vim.lsp.buf.workspace_symbol()
        end,
      }
      keys[#keys + 1] = {
        "<leader>vca",
        function()
          vim.lsp.buf.code_action()
        end,
      }
      keys[#keys + 1] = {
        "<leader>vrr",
        function()
          vim.lsp.buf.references()
        end,
      }
      keys[#keys + 1] = {
        "<leader>vrn",
        function()
          vim.lsp.buf.rename()
        end,
      }
      keys[#keys + 1] = {
        mode = "i",
        "<C-h>",
        function()
          vim.lsp.buf.signature_help()
        end,
      }
      keys[#keys + 1] = {
        "[d",
        function()
          vim.diagnostic.goto_next({ float = { border = "rounded" } })
        end,
      }
      keys[#keys + 1] = {
        "]d",
        function()
          vim.diagnostic.goto_prev({ float = { border = "rounded" } })
        end,
      }
    end,
  },
}
