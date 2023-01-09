local g = vim.g
local opt = vim.opt
local api = vim.api
local keymap = vim.keymap

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true -- Set highlight on search
opt.number = true -- Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Enable undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital ins earch
opt.smartcase = true --Case insensitive unless captal letter
opt.updatetime = 250 --Time waited before CursorHold or writing to swap file
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"

keymap.set({'n', 'v'}, 'y', "\"+y")
