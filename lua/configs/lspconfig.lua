-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  html = {},
  cssls = {},
  vtsls = {},
  eslint = {},
  terraformls = {},
  yamlls = {},
  docker_compose_language_service = {},
  dockerls = {},
  gopls = {},
  ruff_lsp = {},
  intelephense = {},
  tailwindcss = {},
  prismals = {},
  bashls = {},
  jsonls = {},
  solargraph = {},
}

local nvlsp = require "nvchad.configs.lspconfig"

for lsp, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  lspconfig[lsp].setup { opts }
end
