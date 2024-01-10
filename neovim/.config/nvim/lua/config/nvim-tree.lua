local M = {}

function M.setup()
    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
    })
end

function M.get_keymaps()
    return {
        {
            keymaps = {
                n = {
                    name = "Nvim Tree",
                    t = { "<cmd>NvimTreeToggle<cr>", "Nvim-Tree Toggle" },
                },
            },
            opts = { prefix = "<leader>" }
        }
    }
end

return M
