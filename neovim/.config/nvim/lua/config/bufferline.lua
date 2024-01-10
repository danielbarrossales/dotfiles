local M = {}

function M.get_keymaps()
    return {
        {
            keymaps = {
                ["<S-l>"] = { "<cmd>BufferLineCycleWindowlessNext<cr>", "Next Tab" },
                ["<S-h>"] = { "<cmd>BufferLineCycleWindowlessPrev<cr>", "Previous Tab" },
                ["<S-t>"] = { "<cmd>BufferLineCycleWindowlessToggle<cr>", "Toggle Tab" },
                ["<S-p>"] = { "<cmd>BufferLinePickClose<cr>", "Pick Close Buffer" },
                ["<S-o>"] = { "<cmd>BufferLineCloseOthers<cr>", "Close Others Buffers" },
                ["<S-c>"] = { "<cmd>bp | sp | bn | bd<cr>", "Close Current Buffer" },
            }, opts = { mode = "n", noremap = true, silent = true }
        }
    }
end

return M
