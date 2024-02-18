return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require 'mason-lspconfig'.setup({
      automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "prismals"
      }
    })
  end
}
