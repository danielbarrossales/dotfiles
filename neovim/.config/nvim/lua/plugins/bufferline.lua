return 
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
        { "<S-o>", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others Buffers", mode = "n", noremap = true, silent = true },
        { "<leader>bk", "<cmd>bp | sp | bn | bd<cr>", desc = "Close Current Buffer", mode = "n", noremap = true, silent = true },
    },
    lazy = false,
}
