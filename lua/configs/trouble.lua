vim.keymap.set("n", "<leader>tt", function()
  require("trouble").open { mode = "diagnostics" }
end)

vim.keymap.set("n", "[t", function()
  require("trouble").next { skip_groups = true, jump = true }
end)

vim.keymap.set("n", "]t", function()
  require("trouble").prev { skip_groups = true, jump = true }
end)
