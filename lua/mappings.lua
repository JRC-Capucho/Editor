local map = vim.keymap.set

vim.g.mapleader = " "

-- map("n", "<leader>pv", vim.cmd.Ex)
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

map("n", "<C-j>", "<cmd>cnext<CR>zz")
map("n", "<C-k>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })

-- telescope
map("n", "<leader>vh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<C-p>", "<cmd>Telescope git_files<CR>", { desc = "telescope git commits" })
map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>ps", function()
  return ":Telescope grep_string search=" .. vim.fn.input "Grep > " .. "<cr>"
end, { desc = "telescope find files", expr = true })

map("n", "<leader>pws", function()
  return ":Telescope grep_string search=" .. vim.fn.expand "<cword>" .. "<cr>"
end, { desc = "telescope find files", expr = true })

map("n", "<leader>pWs", function()
  return ":Telescope grep_string search=" .. vim.fn.expand "<cWORD>" .. "<cr>"
end, { desc = "telescope find files", expr = true })

map("n", "<leader>f", function()
  require("conform").format { async = true, lsp_format = "fallback" }
end)

map("n", "<C-\\>", "<cmd>NvimTreeToggle<cr>")

map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end)

map("n", "<leader>tT", function()
  require("neotest").run.run(vim.uv.cwd())
end)

map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end)

map("n", "<leader>tr", function()
  require("neotest").run.run()
end)

map("n", "<leader>tl", function()
  require("neotest").run.run_last()
end)

map("n", "<leader>to", function()
  require("neotest").output.open { enter = true, auto_close = true }
end)

map("n", "<leader>tO", function()
  require("neotest").output_panel.toggle()
end)

map("n", "<leader>tS", function()
  require("neotest").run.stop()
end)

map("n", "<leader>tw", function()
  require("neotest").watch.toggle(vim.fn.expand "%")
end)

map("n", "<leader>tt", function()
  require("trouble").open { mode = "diagnostics" }
end)

map("n", "[t", function()
  require("trouble").next { skip_groups = true, jump = true }
end)

map("n", "]t", function()
  require("trouble").prev { skip_groups = true, jump = true }
end)

map("n", "<leader>gs", function()
  require("neogit").open()
end)

map("n", "<leader>gi", "<cmd>Octo issue list<CR")

map("n", "<leader>gI", "<cmd>Octo issue search<CR>")

map("n", "<leader>gp", "<cmd>Octo pr list<CR>")

map("n", "<leader>gP", "<cmd>Octo pr search<CR>")

map("n", "<leader>gr", "<cmd>Octo repo list<CR")

map("n", "<leader>gS", "<cmd>Octo search<CR>")

map("n", "<leader>zz", function()
  require("zen-mode").setup {
    window = {
      width = 90,
      options = {},
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = true
  vim.wo.rnu = true
end)

map("n", "<leader>zZ", function()
  require("zen-mode").setup {
    window = {
      width = 80,
      options = {},
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = false
  vim.wo.rnu = false
  vim.opt.colorcolumn = "0"
end)

map("n", "<leader>D", "<cmd>DBUIToggle<CR>")
