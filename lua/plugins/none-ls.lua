return {
  "nvimtools/none-ls.nvim",
  keys = {
    { "<leader>cf",
      function ()
       vim.lsp.buf.format({
          filter = function (client)
            return client.name == 'null-ls'
          end
        })
      end
    , desc = "Formatting" },
  },
  config = function()
    local null_ls = require("null-ls")
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    local hover = null_ls.builtins.hover
    local completion = null_ls.builtins.completion

    null_ls.setup({
      sources = {
        formatting.stylua.with({
          filetypes = { "lua" },
        }),
        diagnostics.eslint,
        formatting.prettier.with({
          filetypes = { "javascript", "typescript" },
        }),
      },
    })
  end,
}
