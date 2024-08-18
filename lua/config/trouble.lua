local trouble = require "trouble"



vim.keymap.set("n", "<leader>tt", function()
    trouble.open { mode = "diagnostics" }
end)

vim.keymap.set("n", "[t", function ()
    trouble.next { skip_groups = true, jump = true }
end)


vim.keymap.set("n", "]t", function ()
    trouble.prev { skip_groups = true, jump = true }
end)
