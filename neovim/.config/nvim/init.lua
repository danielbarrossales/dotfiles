local g = vim.g

g.maplocalleader = " "
g.mapleader = " "
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

require("plugins").setup()
require("keymaps").setup()
