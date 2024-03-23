local g = vim.g
g.maplocalleader = " "
g.mapleader = " "

vim.api.nvim_set_keymap('', '<Space>', '<Nop>',
{ noremap = true, silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

local sep = package.config:sub(1,1)
local isNotWindows = sep ~= "\\"

local listCommand = isNotWindows and "ls " or "dir /b "

local filesOut = io.popen(listCommand .. vim.fn.stdpath('config') .. sep ..
          'lua' .. sep .. 'plugins')

if filesOut then
    for file in filesOut:lines() do
        local moduleName = file:match("[^/]*.lua$")
        if moduleName then
            table.insert(
                plugins,
                require("plugins." .. moduleName:gsub("%.lua$", "")))
        end
    end
end

require('lazy').setup(plugins)
require("config.keymaps")
