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
            \ "## Five Things I'm Grateful For", "1. ",
            \ "## Today's Objectives || project:personal.daily due:eod +private",  "* ",
            \ "## Daily Review",
            \ "### What went well?",  "* ",
            \ "### What didn't go to plan?",  "* ",
            \ "### What did I learn?",  "* " ])
            ]]
        end,
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
    {
      "michal-h21/vim-zettel",
      init = function()
        local g = vim.g
        g.zettel_format = "%y%m%d-%H%M_%title"
      end,
      dependencies = {
        "junegunn/fzf.vim",
        "junegunn/fzf",
        "vimwiki/vimwiki",
      },
      keys = function ()
        local function createZettel()
          local userInput = vim.fn.input('Enter title for new Zettel: ')
          vim.cmd('ZettelNew ' .. userInput)
        end

        return {
          { "<leader>wzn", createZettel, { desc = "Create new Zettel" }},
          { "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
          { "<leader>wzo", "<CMD>ZettelOpen<CR>" },
          { "<leader>wzi", "<CMD>ZettelInsert<CR>" },
          { "<leader>wzc", "<CMD>ZettelCapture<CR>" },
          { "<leader>wzb", "<CMD>ZettelBackLinks<CR>" },
          { "<leader>wzx", "<CMD>ZettelInbox<CR>" },
          { "<leader>wzl", "<CMD>ZettelGenerateLinks<CR>" },
          { "<leader>wzt", "<CMD>ZettelGenerateTags<CR>" },
          { "<LEADER>wzs", "<CMD>ZettelSearch<CR>" },
          { "<LEADER>wzy", "<CMD>ZettelYankName<CR>" },
        }
      end,
    }
  }
