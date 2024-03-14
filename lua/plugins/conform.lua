return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require 'conform'

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { "prettier" },
      },
      fomart_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end
}
