local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp = require "cmp"
local cmp_action = require("lsp-zero").cmp_action()

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

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
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "codeium", group_index = 2 },
    { name = "git" },
    { name = "path" },
    { name = "vim-dadbod-completion" },
  },
  window = {
    completion = {
      border = border "CmpBorder",
      -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
      winhighlight = "Normal:CmpPmenu,Search:None",
      scrollbar = false,
    },
    documentation = {
      border = border "CmpDocBorder",
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

  maping = cmp.mapping.preset.insert {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-s>;"] = cmp_action.luasnip_supertab(),
    ["<C-s>,"] = cmp_action.luasnip_shift_supertab(),
  },
}
