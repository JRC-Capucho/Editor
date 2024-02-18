vim.g.mapleader = "\\"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.incsearch = true
vim.opt.hlsearch = true


vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false          -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true     -- Put new windows below current
vim.opt.splitright = true     -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true

vim.opt.guicursor = {
    "n-v-c:block",                               -- Normal, visual, command-line: block cursor
    "i-ci-ve:ver25",                             -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
    "r-cr:hor20",                                -- Replace, command-line replace: horizontal bar cursor with 20% height
    "o:hor50",                                   -- Operator-pending: horizontal bar cursor with 50% height
    "a:blinkwait700-blinkoff400-blinkon250",     -- All modes: blinking settings
    "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

vim.o.clipboard = "unnamedplus"

