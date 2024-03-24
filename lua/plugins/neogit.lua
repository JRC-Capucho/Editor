return {
  "neogitorg/neogit",
  event = "VeryLazy",
  dependencies = {
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  keys = {
    {
      "<leader>gs",
      function()
        require 'neogit'.open()
      end,
      silent = true,
      noremap = true,
      desc = "neogit open"
    },
    { "<leader>gc", "<cmd>neogit commit<cr>",          silent = true, noremap = true, desc = "git commit" },
    { "<leader>gp", "<cmd>neogit pull<cr>",            silent = true, noremap = true, desc = "git pull" },
    { "<leader>gp", "<cmd>neogit push<cr>",            silent = true, noremap = true, desc = "git push" },
    { "<leader>gb", "<cmd>telescope git_branches<cr>", silent = true, noremap = true, desc = "git branches" },
    { "<leader>gb", "<cmd>:g blame<cr>",               silent = true, noremap = true, desc = "git blame" },
  },
  config = true,
}
