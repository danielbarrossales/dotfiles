local M = {}

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

function M.setup()

    local plugins = {
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
        },
        {
            "neovim/nvim-lspconfig",
            config = require("config.lsp").setup,
            dependencies = {
                {
                    "williamboman/mason-lspconfig.nvim",
                    dependencies = "williamboman/mason.nvim",
                },
                {
                    "folke/neodev.nvim",
                    config = function()
                        require("neodev").setup({
                            library = { plugins = { "nvim-dap-ui" },
                            types = true },
                        })
                    end,
                }
            },
        },
        {
            "rcarriga/nvim-dap-ui",
            config = require("config.dapui").setup,
            dependencies = "mfussenegger/nvim-dap",
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons'},
            config = function()
                require("lualine").setup()
            end,
        },
        {
            "roobert/bufferline-cycle-windowless.nvim",
            dependencies = {
                {
                    "akinsho/bufferline.nvim",
                    config = function()
                        require("bufferline").setup()
                    end,
                },
            },
            config = function()
                require("bufferline-cycle-windowless").setup({
                    -- whether to start in enabled or disabled mode
                    default_enabled = true,
                })
            end,
        },
        "RRethy/vim-illuminate",
    }

    require("lazy").setup(plugins)
end

return M
