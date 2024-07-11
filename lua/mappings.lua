-- require "nvchad.mappings"

local map = vim.keymap.set
vim.g.mapleader = " "

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<Esc>", "<cmd>nohl<cr>")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")
map("i", "<C-[>", "<Esc>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- telescope
map("n", "<leader>vh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<C-p>", "<cmd>Telescope git_files<CR>", { desc = "telescope git commits" })
map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>ps", function()
  return ":Telescope grep_string search=" .. vim.fn.input "Grep > " .. "<cr>"
end
, { desc = "telescope find files", expr = true })

map("n", "<leader>pws", function()
  return ":Telescope grep_string search=" .. vim.fn.expand "<cword>" .. "<cr>"
end
, { desc = "telescope find files", expr = true })

map("n", "<leader>pWs", function()
  return ":Telescope grep_string search=" .. vim.fn.expand "<cWORD>" .. "<cr>"
end
, { desc = "telescope find files", expr = true })
