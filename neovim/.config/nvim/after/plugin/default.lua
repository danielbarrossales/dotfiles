local o = vim.o
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

local opt = vim.opt
opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 240, bg = "Grey" })
