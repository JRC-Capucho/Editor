require("mason").setup()
require("mason-null-ls").setup({
  ensure_installed = {
    "pint",
    "goimports",
    "gofmt",
  },
  automatic_installation = false,
  handlers = {},
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.pint,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofmt,
  },
})
