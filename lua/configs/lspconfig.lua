-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

local map = vim.keymap.set

nvlsp.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "[d", vim.diagnostic.goto_next, opts "...")
  map("n", "]d", vim.diagnostic.goto_prev, opts "...")
  map("n", "<leader>vd", vim.diagnostic.open_float, opts "...")
  map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts "...")
  map("n", "K", vim.lsp.buf.hover, opts "...")

  map("n", "<leader>vrn", function()
    require "nvchad.lsp.renamer"()
  end, opts "NvRenamer")

  map({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts "Code action")
  map("n", "<leader>vrr", vim.lsp.buf.references, opts "Show references")
end

-- EXAMPLE
local servers = {
  html = {},
  cssls = {},
  eslint = {},
  yamlls = {},
  docker_compose_language_service = {},
  dockerls = {},
  intelephense = {},
  prismals = {},
  bashls = {},
  jsonls = {},

  tailwindcss = {
    filetypes_exclued = { "markdown", "blade" },
  },

  vtsls = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  require("lspconfig")[name].setup(opts)
end

require("flutter-tools").setup {
  ui = {
    border = "rounded",
    notification_style = "native",
  },
  widget_guides = {
    enabled = true,
  },
  lsp = {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.get_capabilities,
    on_init = nvlsp.on_init,
  },
}
