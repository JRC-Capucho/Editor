return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "phpstan",
        "pint",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
    },
  },
}
