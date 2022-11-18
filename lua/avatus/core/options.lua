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
