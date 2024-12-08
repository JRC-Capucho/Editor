local opt = vim.opt
local o = vim.o

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true
o.numberwidth = 1

vim.g.lazydev_enabled = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

o.cursorline = false
-- o.cursorlineopt = "number"

opt.autoindent = true
vim.opt.smartindent = true
opt.smarttab = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.backspace = { "start", "eol", "indent" }
opt.cmdheight = 2

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.inccommand = "split"

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.showmode = false

opt.fillchars = {
	eob = " ",
}

opt.laststatus = 0

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})
