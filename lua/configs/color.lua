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
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {
        style = "deep",
        transparent = true,
        lualine = {
          transparent = true,
        },
      }
      Theme "onedark"
    end,
  },
}
