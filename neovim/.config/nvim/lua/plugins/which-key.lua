return 
{
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function ()
        local wk = require("which-key")
        wk.setup()

        wk.register({
            z = {
                name = "Lazy",
                i = { "<cmd>Lazy install<cr>", "Lazy Install" },
                u = { "<cmd>Lazy update<cr>", "Lazy Update" },
                p = { "<cmd>Lazy profile<cr>", "Lazy Profile" },
                c = { "<cmd>Lazy clean<cr>", "Lazy Clean" },
                s = { "<cmd>Lazy sync<cr>", "Lazy Sync" },
                w = { "<cmd>Lazy show<cr>", "Lazy Show" },
                l = { "<cmd>Lazy log<cr>", "Lazy log" },
                k = { "<cmd>Lazy check<cr>", "Lazy check" },
            },
            c = { name = "Code" },
            f = { name = "Find" },
        }, { prefix = "<leader>" }
        )
    end,
}
