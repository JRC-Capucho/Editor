local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp_zero.default_keymaps(opts)
  lsp_zero.buffer_autoformat()
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

require('mason').setup({
  ui = {
    icons = {
      package_installed = "",
      package_pending = "➜",
      package_uninstalled = "",
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "eslint",
    "terraformls",
    "yamlls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "pyright",
    "phpactor",
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
      require('lspconfig')[server_name].setup({})
    end,
  }
})



require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        ["/path/from/root/of/project"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  }
}



local cmp = require "cmp"
local cmp_action = require('lsp-zero').cmp_action()


cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    fields = { 'menu', 'abbr', 'kind' },

    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-s>;'] = cmp_action.luasnip_supertab(),
    ['<C-s>,'] = cmp_action.luasnip_shift_supertab(),
  }),
})
