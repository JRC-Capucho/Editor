return {
  "neovim/nvim-lspconfig",
  dependencies = { "lukas-reineke/lsp-format.nvim" },
  config = function()
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local on_attach = require("lsp-format").on_attach

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.prismals.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
