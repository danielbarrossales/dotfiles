return
{
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "typescript" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      "ahmedkhalf/project.nvim"
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('projects')
    end,
    keys = function()
      local builtin = require('telescope.builtin')
      return {
        {'<leader>pf', builtin.find_files, desc = 'Telescope find files' },
        {'<C-p>', builtin.git_files, desc = 'Telescope find git files' },
        {
          '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ")})
          end, desc = 'Telescope find files'
        },
      }
    end,
    opts = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_cursor{},
        },
      },
    }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ahmedkhalf/project.nvim",
    config = function ()
      require("project_nvim").setup()
    end,
  }
}
