return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    lazy = true,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "vim",
          "regex",
          "markdown",
          "markdown_inline",
          "bash",
          "query",
          "vimdoc",
          "sql",
          "norg",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead",
    lazy = true,
    enabled = true,
    opts = { mode = "cursor", max_lines = 3 },
  }
}
