return {
    -- Colorscheme
    {
        "Mofiqul/dracula.nvim",
        init = function()
            vim.cmd[[colorscheme dracula]]
        end,
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                config = {
                    header = {
                        "",
                        " ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷",
                        " ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇",
                        " ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽",
                        " ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕",
                        " ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕",
                        " ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕",
                        " ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄",
                        " ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕",
                        " ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿",
                        " ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                        " ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟",
                        " ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠",
                        " ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙",
                        " ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣",
                        "",
                    },
                    footer = function()
                        local info = {}
                        local fortune = require('fortune').get_fortune()
                        info[1] = '  Neovim loaded ' .. vim.fn.strftime('%H:%M') .. ' on ' .. vim.fn.strftime('%d/%m/%Y') .. ' '
                        local footer = vim.list_extend(info, fortune)
                        return footer
                    end,
                    shortcut = {
                        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = "Quit",
                            action = "q",
                            key = "q",
                        }
                    },
                }
            }
        end,
        dependencies = {
            {'nvim-tree/nvim-web-devicons'},
            {'rubiin/fortune.nvim'}
        }
    },
    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    {
        "roobert/bufferline-cycle-windowless.nvim",
        dependencies = {
            "akinsho/bufferline.nvim",
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons',
            config = function()
                require("bufferline").setup()
            end,
            init = function()
                vim.opt.termguicolors = true
            end,
        },
        config = function (_, opts)
            require("bufferline-cycle-windowless").setup(opts)
        end,
        opts = {
            default_enabled = true,
        },
        keys = {
            { "<S-l>", "<cmd>BufferLineCycleWindowlessNext<cr>", desc = "Next Tab", mode = "n", noremap = true, silent = true },
            { "<S-h>", "<cmd>BufferLineCycleWindowlessPrev<cr>", desc = "Previous Tab", mode = "n", noremap = true, silent = true },
            { "<S-t>", "<cmd>BufferLineCycleWindowlessToggle<cr>", desc = "Toggle Tab", mode = "n", noremap = true, silent = true },
            { "<S-p>", "<cmd>BufferLinePickClose<cr>", desc = "Pick Close Buffer", mode = "n", noremap = true, silent = true },
            { "<S-e>", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others Buffers", mode = "n", noremap = true, silent = true },
            { "<leader>bk", "<cmd>bp | sp | bn | bd<cr>", desc = "Close Current Buffer", mode = "n", noremap = true, silent = true },
        },
        lazy = false,
    }
}
