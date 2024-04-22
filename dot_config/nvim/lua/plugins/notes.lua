return {
    {
        "vimwiki/vimwiki",
        init = function ()
            vim.g.vimwiki_list = {
                { path = "~/Documents/vimwiki/",
                syntax = "markdown",
                ext = "md" }
            }
            -- Set autocmd for new diary entries
            vim.cmd([[
            au BufNewFile ~/Documents/vimwiki/diary/*.md
            \ call append(0,[
            \ "# " . split(expand('%:r'),'/')[-1], "***",
            \ "## Thoughts and Feelings", "* ",
            \ "## Five Things I'm Grateful For", "1. ",
            \ "## Today's Objectives || project:personal.daily due:eod +private",  "* ",
            \ "## Daily Review",
            \ "### What went well?",  "* ",
            \ "### What didn't go to plan?",  "* ",
            \ "### What did I learn?",  "* " ])
            ]])
        end
    },
    {
        "renerocksai/telekasten.nvim",
        dependencies = {"nvim-telescope/telescope.nvim"},
        keys = {
            -- Launch panel if nothing is typed after <leader>z
            { "<leader>z", "<cmd>Telekasten panel<CR>" },
            -- Most used functions
            { "<leader>zf", "<CMD>Telekasten find_notes<CR>" },
            { "<leader>zg", "<cmd>Telekasten search_notes<CR>" },
            { "<leader>zd", "<cmd>Telekasten goto_today<CR>" },
            { "<leader>zz", "<cmd>Telekasten follow_link<CR>" },
            { "<leader>zn", "<cmd>Telekasten new_note<CR>" },
            { "<leader>zc", "<cmd>Telekasten show_calendar<CR>" },
            { "<leader>zb", "<cmd>Telekasten show_backlinks<CR>" },
            { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>" },
            -- Call insert link automatically when we start typing a link
            { "[[", "<cmd>Telekasten insert_link<CR>", mode = "i" },
        },
        opts = {
            home = vim.fn.expand("~/Documents/vimwiki"),
            auto_set_filetype = false,
            auto_set_syntax = false,
            new_note_filename = "uuid-title"
        },
    },
}
