require('telescope').setup({})

local builtin = require "telescope.builtin"

local map = vim.keymap.set

map("n", "<leader>pf", builtin.find_files, {})

map("n", "<C-p>", builtin.git_files, {})

map("n", "<leader>pws", function()
    local word = vim.fn.expand "<cword>"
    builtin.grep_string { search = word }
end)

map("n", "<leader>pWs", function()
    local word = vim.fn.expand "<cWORD>"
    builtin.grep_string { search = word }
end)

map("n", "<leader>ps", function()
    builtin.grep_string { search = vim.fn.input "Grep > " }
end)

map("n", "<leader>vh", builtin.help_tags, {})

map("n", "<leader>pc", function()
    require("telescope").extensions.flutter.commands()
end)

map("n", "<leader>pt", builtin.treesitter, {})
