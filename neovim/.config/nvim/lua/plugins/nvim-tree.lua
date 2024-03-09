return
{
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function (_, opts)
            require("nvim-tree").setup(opts)
        end,
        opts = {
            actions = {
              open_file = {
                quit_on_open = true,
              }
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            hijack_netrw = true,
        },
        lazy = false,
        keys = {
            { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "Nvim-Tree Toggle" }
        },
    }
}
