require("mason").setup()
require("mason-null-ls").setup({
  ensure_installed = {
    "selene",
    "pint",
    "goimports",
    "gofmt",
    "black",
    "isort",
    "hadolint"
  },
  automatic_installation = false,
  handlers = {},
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- LUA
    --    null_ls.builtins.diagnostics.selene,
    -- PHP
    null_ls.builtins.formatting.pint,
    -- GO
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofmt,
    -- PYTHON
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    -- DOCKER
    -- null_ls.builtins.diagnostics.hadolint,
  },
})
