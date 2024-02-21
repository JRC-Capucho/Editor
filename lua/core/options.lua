local opt = vim.opt

vim.g.mapleader = "\\"

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termguicolors = true

opt.nu = true
opt.rnu = true

opt.incsearch = true
opt.hlsearch = true


opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 3
opt.expandtab = true
opt.scrolloff = 10
opt.shell = "zsh"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.wrap = false          -- No Wrap lines
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current
opt.splitkeep = "cursor"
opt.mouse = ""
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true

opt.guicursor = {
    "n-v-c:block",                               -- Normal, visual, command-line: block cursor
    "i-ci-ve:ver25",                             -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
    "r-cr:hor20",                                -- Replace, command-line replace: horizontal bar cursor with 20% height
    "o:hor50",                                   -- Operator-pending: horizontal bar cursor with 50% height
    "a:blinkwait700-blinkoff400-blinkon250",     -- All modes: blinking settings
    "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

vim.o.clipboard = "unnamedplus"

