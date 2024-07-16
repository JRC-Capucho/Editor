local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp = require "cmp"
local cmp_action = require("lsp-zero").cmp_action()

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "git" },
    { name = "path" },
    { name = "vim-dadbod-completion" },
    { name = "codeium", group_index = 1, priorty = 100 },
    { name = "buffer" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    fields = { "menu", "abbr", "kind" },

    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "λ",
        luasnip = "⋗",
        buffer = "Ω",
        path = "🖫",
        nvim_lua = "Π",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },

  mapping = cmp.mapping.preset.insert {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-s>;"] = cmp_action.luasnip_supertab(),
    ["<C-s>,"] = cmp_action.luasnip_shift_supertab(),
  },
}
