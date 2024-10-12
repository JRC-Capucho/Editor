vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.numberwidth = 1

vim.g.lazydev_enabled = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.o.cursorline = true
vim.o.cursorlineopt = "number"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
