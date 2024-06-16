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

-- New tab
map("n", "te", ":tabedit")
map("n", "<tab>", ":tabnext<Return>")
map("n", "<s-tab>", ":tabprev<Return>")
-- Split window
map("n", "ss", ":split<Return>")
map("n", "sv", ":vsplit<Return>")
-- Move window
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- telescope
map("n", ";r", "<cmd>Telescope live_grep additional_args=--hidden<CR>", { desc = "telescope live grep" })
map("n", "\\\\", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", ";t", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", ";e", "<cmd>Telescope diagnostic<CR>", { desc = "telescope diagnostic" })
map("n", "<leader>s.", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>sgc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>sgs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

map("n", ";f", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })

-- Format
map("n", "<leader>f", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- nvimtree
map("n", "<leader>/", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
