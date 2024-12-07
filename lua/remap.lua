local map = vim.keymap.set

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

map("n", "<leader>pv", vim.cmd.Ex, opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("n", "<Esc>", "<cmd>nohl<cr>", opts)

map("n", "J", "mzJ`z", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- greatest remap ever
map("x", "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [["+Y]], opts)

-- map("n", "<leader>f", vim.lsp.buf.format,opts)

map({ "n", "v" }, "<leader>d", [["_d]], opts)

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>", opts)
map("i", "<C-[>", "<Esc>", opts)

map("n", "<C-j>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-k>", "<cmd>cprev<CR>zz", opts)

map("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
map("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

map("n", "<leader><leader>", function()
  vim.cmd("so")
end, opts)

-- Resize with arrows
map("n", "<Up>", ":resize -2<CR>", opts)
map("n", "<Down>", ":resize +2<CR>", opts)
map("n", "<Left>", ":vertical resize -2<CR>", opts)
map("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
