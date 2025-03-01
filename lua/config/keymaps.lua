-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("i", "<C-c>", "<Esc>", opts)
vim.keymap.set("i", "<C-[>", "<Esc>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", opts)
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts)
vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)
