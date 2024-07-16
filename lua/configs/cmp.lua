local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp = require "cmp"
local cmp_action = require("lsp-zero").cmp_action()

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup {
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "codeium", group_index = 1, priorty = 100 },
    { name = "git" },
    { name = "path" },
    { name = "vim-dadbod-completion" },
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
        nvim_lsp = "󰯙",
        luasnip = "󰐝",
        buffer = "󰏉",
        path = "󰣙",
        codeium = "󰮇",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,

    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
  },

  mapping = cmp.mapping.preset.insert {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-s>;"] = cmp_action.luasnip_supertab(),
    ["<C-s>,"] = cmp_action.luasnip_shift_supertab(),
  },
}
