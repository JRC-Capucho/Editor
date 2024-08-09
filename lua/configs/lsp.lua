local lsp_zero = require "lsp-zero"
local navic = require "nvim-navic"

local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  lsp_zero.highlight_symbol(client, bufnr)

  lsp_zero.default_keymaps(opts)

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

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
end

lsp_zero.extend_lspconfig {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  lsp_attach = lsp_attach,
  sign_text = true,
  float_border = "rounded",
}

lsp_zero.ui {
  float_border = "rounded",
  sign_text = {
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»",
  },
}

require("flutter-tools").setup {
  -- flutter_path = "/home/zen/.local/bin/flutter/bin/",
  widget_guides = {
    enabled = true,
  },
  lsp = {
    on_attach = lsp_attach,
    capabilities = lsp_zero.get_capabilities(),
  },
}

local lua_opts = lsp_zero.nvim_lua_ls()
require("lspconfig").lua_ls.setup(lua_opts)

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
  "intelephense",
  "isort",
  "json-lsp",
  "lua-language-server",
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
  "delve",
}

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "vtsls",
    "eslint",
    "terraformls",
    "yamlls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "ruff_lsp",
    "intelephense",
    "tailwindcss",
    "prismals",
    "bashls",
    "cssls",
    "html",
    "jsonls",
    "solargraph",
  },

  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,
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
