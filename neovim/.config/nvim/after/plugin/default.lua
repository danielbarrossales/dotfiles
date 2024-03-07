local o = vim.o
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.number = true
o.relativenumber = true
o.termguicolors = true

local opt = vim.opt
opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 240, bg = "Grey" })

opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.background = "dark"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

opt.iskeyword:append("-")
