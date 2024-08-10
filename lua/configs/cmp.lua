local cmp = require "cmp"
local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

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

cmp.setup {
  preselect = "item",
  completion = {
    completeopt = "menu,menuone",
  },
  sources = {
    { name = "nvim_lsp", priority = 10 },
    { name = "codeium", priority = 9 },
    { name = "luasnip", priority = 8 },
    { name = "git" },
    { name = "path" },
    { name = "vim-dadbod-completion" },
  },
  window = {
    completion = {
      border = border "CmpBorder",
      winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
      scrollbar = false,
    },
    documentation = {
      border = border "CmpBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },

  formatting = {
    fields = { "menu", "abbr", "kind" },

    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "󰯙",
        luasnip = "󰏉",
        git = " ",
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
    ["<C-y>"] = cmp.mapping.confirm { select = true },
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-s>;"] = cmp_action.luasnip_jump_forward(),
    ["<C-s>,"] = cmp_action.luasnip_jump_backward(),
  },
}
