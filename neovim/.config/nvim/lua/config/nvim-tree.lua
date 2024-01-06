local M = {}

function M.setup()
    require("nvim-tree").setup()
end

function M.get_keymaps()
    return {
        keymaps = {
            n = {
                name = "Nvim Tree",
                t = { "<cmd>NvimTreeToggle<cr>", "Nvim-Tree Toggle" },
            },
        },
        opts = {}
    }
end

return M
