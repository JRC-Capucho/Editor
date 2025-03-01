local opt = vim.opt

vim.g.lazyvim_php_lsp = "intelephense"
vim.g.have_nerd_font = true
vim.o.shell = "/usr/bin/zsh"

opt.timeoutlen = 300
opt.inccommand = "split"
opt.cursorlineopt = "number"
opt.softtabstop = 4
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.hlsearch = false
opt.incsearch = true
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.clipboard = ""
opt.spell = true
opt.scrolloff = 8
opt.colorcolumn = "80"
