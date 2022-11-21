local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.showtabline = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.cmdheight = 0
opt.undofile = true
opt.pumheight = 10
opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8
opt.updatetime = 300 -- faster completion (4000ms default)
opt.swapfile = false -- creates a swapfile
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.backup = false -- creates a backup file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.iskeyword:append("-")
-- opt.cursorline = true
vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
