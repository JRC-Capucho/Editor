local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "x", '"_x')

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Jumplist
map("n", "<C-m>", "<C-i>", {})

-- New tab
map("n", "te", ":tabedit<Return>", { silent = true, desc = "New Tab" })
map("n", "L", ":tabnext<Return>", { silent = true, desc = "Next Tab" })
map("n", "H", ":tabprev<Return>", { silent = true, desc = "Prev Tab" })

-- Split window
map("n", "ss", ":split<Return>", { silent = true, desc = "Split Horizontal" })
map("n", "sv", ":vsplit<Return>", { silent = true, desc = "Split Vertical" })

-- Resize window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- Neo Tree
map("n", "<leader>e", vim.cmd.NvimTreeToggle, { silent = true, desc = "NvimTree" })

-- OIL
map("n", "sf", ":Oil --float<cr>", { silent = true, desc = "Oil" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { silent = true, desc = "Hover" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { silent = true, desc = "Code action" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", silent = true })
map("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "Definition" })
map("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "Implementation" })
map("n", "J", vim.diagnostic.goto_next, { silent = true, desc = "Diagnostic" })


