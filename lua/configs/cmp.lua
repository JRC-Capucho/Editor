local conf = require "nvchad.configs.cmp"
local cmp = require "cmp"

conf.mapping = cmp.mapping.preset.insert {
  ["<C-y>"] = cmp.mapping.confirm { select = true },
  ["<C-u>"] = cmp.mapping.scroll_docs(-4),
  ["<C-d>"] = cmp.mapping.scroll_docs(4),
  ["<C-p>"] = cmp.mapping(function()
    if cmp.visible() then
      cmp.select_prev_item { behavior = "insert" }
    else
      cmp.complete()
    end
  end),
  ["<C-n>"] = cmp.mapping(function()
    if cmp.visible() then
      cmp.select_next_item { behavior = "insert" }
    else
      cmp.complete()
    end
  end),
  ["<C-e>"] = cmp.mapping.abort(),

  ["<C-s>;"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif require("luasnip").expand_or_jumpable() then
      require("luasnip").expand_or_jump()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<C-s>,"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif require("luasnip").jumpable(-1) then
      require("luasnip").jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
}

table.insert(conf.sources, { name = "git" })
table.insert(conf.sources, { name = "vim-dadbod-completion" })

conf.formatting = {
  fields = { "menu", "abbr", "kind" },

  format = function(entry, item)
    local menu_icon = {
      nvim_lsp = "󰯙",
      luasnip = "󰏉",
      git = " ",
      path = "󰣙",
      buffer = "󰮇",
    }

    item.menu = menu_icon[entry.source.name]
    return item
  end,
}

return conf
