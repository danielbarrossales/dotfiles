return
{
    "nvim-telescope/telescope.nvim",
    dependencies= {
        "nvim-lua/plenary.nvim",
        "ahmedkhalf/project.nvim",
    },
    opts = {},
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("projects")
    end,
    keys = function()
        local telescope = require("telescope.builtin")
        local reuse_win = { reuse_win = true }
        local projects = require("telescope").extensions.projects.projects

        return {
            { "<leader>ff", telescope.find_files, desc = "Find Files" },
            { "<leader>fg", telescope.live_grep, desc = "Live Grep" },
            { "<leader>fb", telescope.buffers, desc = "Buffers" },
            { "<leader>fh", telescope.help_tags, desc = "Help tags" },
            { "<leader>fp", projects, desc = "Projects" },
            {
                "gd",
                function()
                    telescope.lsp_definitions(reuse_win)
                end,
                desc = "Goto Definition",
            },
            { "gr", telescope.lsp_references, desc = "References" },
            { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
            {
                "gI",
                function ()
                    telescope.lsp_implementations(reuse_win)
                end,
                desc = "Goto Implementations",
            },
            {
                "gy",
                function ()
                    telescope.lsp_type_definitions(reuse_win)
                end,
                desc = "Goto T[y]pe Definition"
            },
        }
    end
}
