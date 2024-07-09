-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  { "folke/flash.nvim",                    enabled = false, },
  { "echasnovski/mini.pairs",              enabled = false, },
  { "echasnovski/mini.ai",                 enabled = false, },
  -- { "echasnovski/mini.icons",              enabled = false, },
  { "nvim-pack/nvim-spectre",              enabled = false, },
  { "folke/which-key.nvim",                enabled = false },
  { "folke/todo-comments.nvim",            enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "folke/persistence.nvim",              enabled = false },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "folke/trouble.nvim",
    keys = {
      {
        "<leader>tt", function()
        require 'trouble'.toggle({ mode = "diagnostics" })
      end
      },
      {
        "[t", function()
        require 'trouble'.next({ jump = true, skip_groups = true })
      end
      },
      {
        "]t", function()
        require "trouble".prev({ skip_groups = true, jump = true })
      end
      }
    }
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
      keys[#keys + 1] = { "<leader>vws", function() vim.lsp.buf.workspace_symbol() end }
      keys[#keys + 1] = { "<leader>vd", function() vim.diagnostic.open_float() end }
      keys[#keys + 1] = { "gd", function() vim.lsp.buf.definition() end }
      keys[#keys + 1] = { "K", function() vim.lsp.buf.hover() end }
      keys[#keys + 1] = { "<leader>vws", function() vim.lsp.buf.workspace_symbol() end }
      keys[#keys + 1] = { "<leader>vd", function() vim.diagnostic.open_float() end }
      keys[#keys + 1] = { "<leader>vca", function() vim.lsp.buf.code_action() end }
      keys[#keys + 1] = { "<leader>vrr", function() vim.lsp.buf.references() end }
      keys[#keys + 1] = { "<leader>vrn", function() vim.lsp.buf.rename() end }
      keys[#keys + 1] = { "<C-h>", function() vim.lsp.buf.signature_help() end }
      keys[#keys + 1] = { "[d", function() vim.diagnostic.goto_next() end }
      keys[#keys + 1] = { "]d", function() vim.diagnostic.goto_prev() end }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>gs", false
      },
      {
        "<leader>pf",
        function() require("telescope.builtin").find_files({}) end,
        desc = "Find Plugin File",
      },
      {
        "<C-p>", function()
        require 'telescope.builtin'.git_files({})
      end
      },
      {
        "<leader>pws", function()
        local word = vim.fn.expand "<cword>"
        require 'telescope.builtin'.grep_string({ search = word })
      end
      },
      {
        "<leader>pWs", function()
        local word = vim.fn.expand "<cWORD>"
        require 'telescope.builtin'.grep_string({ search = word })
      end
      },
      {
        "<leader>ps", function()
        require 'telescope.builtin'.grep_string({ search = vim.fn.input "Grep > " })
      end
      },
      {
        "<leader>vh", function()
        require 'telescope.builtin'.help_tags()
      end
      }
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    --@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require 'cmp'

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete(),
      }
    end
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = function()
      require 'neogit'.setup {}
      require 'config.fugitive'
    end
  },
}
