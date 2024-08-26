local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local m = {}

local cmp = require("cmp")

m.mapping = cmp.mapping.preset.insert({
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-u>"] = cmp.mapping.scroll_docs(-4),
  ["<C-d>"] = cmp.mapping.scroll_docs(4),
  ["<C-p>"] = cmp.mapping(function()
    if cmp.visible() then
      cmp.select_prev_item({ behavior = "insert" })
    else
      cmp.complete()
    end
  end),
  ["<C-n>"] = cmp.mapping(function()
    if cmp.visible() then
      cmp.select_next_item({ behavior = "insert" })
    else
      cmp.complete()
    end
  end),
  ["<C-e>"] = cmp.mapping.abort(),
})

m.formatting = {
  fields = { "menu", "abbr", "kind" },

  format = function(entry, item)
    local menu_icon = {
      nvim_lsp = "󰯙",
      luasnip = "󰏉",
      git = " ",
      path = "󰣙",
      snippets = "󰮇",
      codeium = " ",
    }

    item.menu = menu_icon[entry.source.name]
    return item
  end,
}

m.window = {
  completion = {
    border = border("CmpBorder"),
    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
    scrollbar = false,
  },
  documentation = {
    border = border("CmpBorder"),
    winhighlight = "Normal:CmpDoc",
  },
}

return m
