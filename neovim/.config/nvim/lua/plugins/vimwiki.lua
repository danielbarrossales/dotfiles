return {
    {
        "vimwiki/vimwiki",
        init = function()
            vim.cmd[[
            set nocompatible
            filetype plugin on
            syntax on
            let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
            \ 'syntax': 'markdown',
            \ 'ext': 'md',
            \ 'path_html': '~/Documents/vimwiki/site_html/',
            \ 'custom_wiki2html': 'vimwiki_markdown',
            \ 'template_ext': 'tpl'}]

            au BufNewFile ~/Documents/vimwiki/diary/*.md
            \ call append(0,[
            \ "# " . split(expand('%:r'),'/')[-1], "***",
            \ "## Thoughts and Feelings", "* ",
            \ "## Five Things I'm Grateful For || project:personal.daily due:eod +private", "1. ",
            \ "## Todays Objectives",  "* ",
            \ "## Daily Review",
            \ "### What went well?",  "* ",
            \ "### What didn't go to plan?",  "* ",
            \ "### What did I lean?",  "* " ])
            ]]
        end,
    },
    {
        "WnP/vimwiki_markdown"
    },
    {
        "zk-org/zk-nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        opts = {},
        config = function(_, config)
            require("zk").setup(config)
            require("telescope").load_extension("zk")
        end,
        init = function ()
            vim.cmd[[
                " markdownWikiLink is a new region
                    syn region markdownWikiLink matchgroup=markdownLinkDelimiter start="\[\[" end="\]\]" contains=markdownUrl keepend oneline concealends
                    " markdownLinkText is copied from runtime files with 'concealends' appended
                    syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends
                    " markdownLink is copied from runtime files with 'conceal' appended
                    syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal
            ]]
        end,
    },
    "tools-life/taskwiki",
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }

}
