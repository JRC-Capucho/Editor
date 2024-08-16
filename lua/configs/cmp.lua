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
}

table.insert(conf.sources, { name = "git" })
table.insert(conf.sources, { name = "vim-dadbod-completion" })

return conf
