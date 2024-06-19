-- require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>pv", "<CMD>Oil<cr>")
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

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- telescope
map("n", "<leader>ps", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>vh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })

map("n", "<leader>pWs", function()
    local word = vim.fn.expand "<cWORD>"
    require("telescope.builtin").grep_string { search = word }
end, { desc = "telescope nvchad themes" })

map("n", "<leader>pws", function()
    local word = vim.fn.expand "<cword>"
    require("telescope.builtin").grep_string { search = word }
end, { desc = "telescope nvchad themes" })

map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>pt", "<cmd>Telescope treesitter<cr>", { desc = "telescope find files" })

-- Format
map("n", "<leader>f", function()
    vim.lsp.buf.format { timeout_ms = 2000 }
end, { desc = "format files" })

-- nvimtree
map("n", "<C-\\>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
