require("mason").setup()
require("mason-null-ls").setup({
  ensure_installed = {
    "selene",
    --PHP
    "phpcs",
    "php-cs-fixer",
    --GO
    "goimports",
    "gofmt",
    --PY
    "black",
    "isort",
    --DOCKER
    "hadolint",
    --TERRAFORM
    'tflint',
    "sqlfluff",
  },
  automatic_installation = false,
  handlers = {},
})

local nls = require("null-ls")

nls.setup({
  sources = {
    -- LUA
    nls.builtins.diagnostics.selene,
    -- PHP
    nls.builtins.formatting.pint,
    -- GO
    nls.builtins.formatting.goimports,
    nls.builtins.formatting.gofmt,
    -- PYTHON
    nls.builtins.formatting.black,
    nls.builtins.formatting.isort,
    -- DOCKER
    nls.builtins.diagnostics.hadolint,
    -- PHP
    nls.builtins.formatting.phpcsfixer,
    nls.builtins.diagnostics.phpcs,
    --TERRAFORM
    nls.builtins.formatting.terraform_fmt,
    nls.builtins.diagnostics.terraform_validate,
    nls.builtins.diagnostics.sqlfluff,
  },
})
