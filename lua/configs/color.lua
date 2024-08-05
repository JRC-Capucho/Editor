local function Theme(color)
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
end

return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup {
        style = "storm",
        transparent = true,
        terminal_colors = true,
      }
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        disable_background = true,
        styles = {
          transparent = true,
        },
      }
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup {
  --       style = "deep",
  --       transparent = true,
  --       lualine = {
  --         transparent = true,
  --       },
  --     }
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        cmp = true,
        dashboard = true,
        gitsigns = true,
        lsp_trouble = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        diffview = true,
        fidget = true,
        harpoon = true,
        neogit = true,
        octo = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        styles = {
          conditionals = "italic",
          comments = "italic",
          keywords = "bold,italic",
        },
        options = {
          cursorline = true,
          transparency = true,
          terminal_colors = true,
          lualine_transparency = true,
          highlight_inactive_windows = true,
        },
      }
      Theme "onedark_vivid"
    end,
  },
}
