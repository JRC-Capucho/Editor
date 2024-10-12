local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format({ details = true })

require("luasnip").config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI"
})

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


cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert',
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
  sources = {
    { name = 'nvim_lsp' },
    {
      name = "lazydev",
      group_index = 0,
    },
    -- { name = "buffer" },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = "git" },
    { name = "vim-dadbod-completion" },
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-y>"] = cmp.mapping.confirm { select = true },
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),

    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

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
  },

  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },

  formatting = {
    fields = { "menu", "abbr", "kind" },

    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "",
        luasnip = "",
        git = " ",
        path = "󰣙",
        buffer = "",
        nvim_lua = "󰮇",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  }
})
