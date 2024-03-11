local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", {})

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true, desc = "New Tab" })
keymap.set("n", "L", ":tabnext<Return>", { silent = true, desc = "Next Tab" })
keymap.set("n", "H", ":tabprev<Return>", { silent = true, desc = "Prev Tab" })

-- Split window
keymap.set("n", "ss", ":split<Return>", { silent = true, desc = "Split Horizontal" })
keymap.set("n", "sv", ":vsplit<Return>", { silent = true, desc = "Split Vertical" })

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Neo Tree
keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { silent = true, desc = "NvimTree" })

-- OIL
keymap.set("n", "sf", ":Oil --float<cr>", { silent = true, desc = "Oil" })

-- LSP
keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, desc = "Hover" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { silent = true, desc = "Code action" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", silent = true })
keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "Definition" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "Implementation" })
keymap.set("n", "J", vim.diagnostic.goto_next, { silent = true, desc = "Diagnostic" })
