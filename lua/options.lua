require "nvchad.options"

vim.o.relativenumber = true
vim.o.wrap = false

vim.o.ignorecase = false
vim.o.smartcase = false

vim.opt.guicursor = ""

vim.opt.inccommand = "split"
vim.opt.nu = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.o.clipboard = "unnamed"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

-- vim.opt.list = true
-- vim.opt.listchars = { tab = " ", trail = "·", nbsp = "␣" }
-- vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append { "**" } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { "*/node_modules/*" }
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""

-- Undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]

-- Add asterisks in block comments
vim.opt.formatoptions:append { "r" }

vim.cmd [[au BufNewFile,BufRead *.astro setf astro]]
vim.cmd [[au BufNewFile,BufRead Podfile setf ruby]]
