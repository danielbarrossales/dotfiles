local M = {}

function M.get_keymaps()
    return {
        keymaps = {
            ["<S-l>"] = { "<cmd>BufferLineCycleWindowlessNext<cr>", "Next Tab" },
            ["<S-h>"] = { "<cmd>BufferLineCycleWindowlessPrev<cr>", "Previous Tab" },
            ["<S-t>"] = { "<cmd>BufferLineCycleWindowlessToggle<cr>", "Toggle Tab" },
        }, opts = { mode = "n", noremap = true, silent = true }
    }
end

return M
