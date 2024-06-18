local truezen = require "true-zen"
local map = vim.keymap.set

map("n", "<leader>zn", function()
    local first = 0
    local last = vim.api.nvim_buf_line_count(0)
    truezen.narrow(first, last)
end, { noremap = true })
map("v", "<leader>zn", function()
    local first = vim.fn.line "v"
    local last = vim.fn.line "."
    truezen.narrow(first, last)
end, { noremap = true })
map("n", "<leader>zf", truezen.focus, { noremap = true })
map("n", "<leader>zm", truezen.minimalist, { noremap = true })
map("n", "<leader>za", truezen.ataraxis, { noremap = true })
