local lsp_zero = require "lsp-zero"

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp_zero.default_keymaps(opts)
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "<leader>vca", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>vrr", function()
    vim.lsp.buf.references()
  end, opts)
  vim.keymap.set("n", "<leader>vrn", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
end)

lsp_zero.set_sign_icons {
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
}

require("mason").setup {
  ui = {
    icons = {
      package_installed = "",
      package_pending = "➜",
      package_uninstalled = "",
    },
  },
}

local mason_things = {
  "stylua",
  "bash-language-server",
  "black",
  "css-lsp",
  "docker-compose-language-service",
  "dockerfile-language-server",
  "eslint-lsp",
  "goimports",
  "gofumpt",
  "gopls",
  "hadolint",
  "html-lsp",
  "phpactor",
  "isort",
  "json-lsp",
  "lua-language-server",
  "pint",
  "phpcs",
  "prisma-language-server",
  "ruff-lsp",
  "selene",
  "solargraph",
  "sqlfluff",
  "tailwindcss-language-server",
  "terraform-ls",
  "tflint",
  "vtsls",
  "yaml-language-server",
  "hadolint",
}

local lsps = {
  "lua_ls",
  "vtsls",
  "eslint",
  "terraformls",
  "yamlls",
  "docker_compose_language_service",
  "dockerls",
  "gopls",
  "ruff_lsp",
  "phpactor",
  "tailwindcss",
  "prismals",
  "bashls",
  "cssls",
  "html",
  "jsonls",
  "solargraph",
}

require("mason-lspconfig").setup {
  ensure_installed = lsps,

  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,
  },
}

require("lspconfig").gopls.setup {
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = true,
    },
  },
}

require("lspconfig").eslint.setup {
  settings = {
    workingDirectories = { mode = "auto" },
  },
}

require("lspconfig").vtsls.setup {
  ft = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root = { "tsconfig.json", "package.json", "jsconfig.json" },
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
}

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      codeLens = {
        enable = true,
      },
      completion = {
        callSnippet = "Replace",
      },
      doc = {
        privateName = { "^_" },
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
    },
  },
}

require("lspconfig").yamlls.setup {
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        ["/path/from/root/of/project"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  },
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  if mason_things and #mason_things > 0 then
    vim.cmd "Mason"
    local mr = require "mason-registry"

    mr.refresh(function()
      for _, tool in pairs(mason_things) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end
end, {})

vim.g.mason_binaries_list = mason_things
