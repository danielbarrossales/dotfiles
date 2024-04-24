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
            vim.cmd[[
            set nocompatible
            filetype plugin on
            syntax on
            ]]
        end
    },
    {
        "WnP/vimwiki_markdown"
    },
    "tools-life/taskwiki",
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
}
