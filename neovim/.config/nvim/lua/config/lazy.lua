local M = {}

M.keymaps = {
    z = {
        name = "Lazy",
        i = { "<cmd>Lazy install<cr>", "Lazy Install" },
        u = { "<cmd>Lazy update<cr>", "Lazy Update" },
        p = { "<cmd>Lazy profile<cr>", "Lazy Profile" },
        c = { "<cmd>Lazy clean<cr>", "Lazy Clean" },
        s = { "<cmd>Lazy sync<cr>", "Lazy Sync" },
        w = { "<cmd>Lazy show<cr>", "Lazy Show" },
        l = { "<cmd>Lazy log<cr>", "Lazy log" },
        c = { "<cmd>Lazy check<cr>", "Lazy check" },
    }
}

return M
