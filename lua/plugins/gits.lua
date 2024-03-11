return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })
      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<cr>", { desc = "Git Hunks" })
    end,
  },
  {
    "dinhhuy258/git.nvim",
    config = function()
      require("git").setup()
      vim.keymap.set("n", "<leader>gc", ":Git commit<cr>", { desc = "Commit" })
      vim.keymap.set("n", "<leader>gp", ":Git push<cr>", { desc = "Push" })
    end,
  },
}
