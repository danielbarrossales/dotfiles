local M = {}

function M.setup()
  local wk = require("which-key")
  local telescope_keys = require("config.plugin.telescope").get_keymaps()
  local lazy_keys = require("plugins").get_keymaps()

  local opts_n = { noremap = true, silent = true, mode = "n" }

  wk.register({
    p = {
      name = "Project",
      v = { vim.cmd.Ex, "Directory Explore" },
    },
    telescope_keys,
    lazy_keys,
    u = { vim.cmd.UndotreeToggle, "Undootree Toggle" },
  }, { prefix = "<leader>" })

  wk.register({
    J = { ":m '>+1<CR>gv=gv", "Move Selection Down" },
    K = { ":m '<-2<CR>gv=gv", "Move Selection Up" },
  }, { mode = "v" })

  wk.register({
    ["<C-a"] = { "gg<S-v>G", "Select All" },
    t = {
      e = { vim.cmd.tabedit, "Tab Edit" },
      c = { vim.cmd.tabclose, "Close Tab" },
    },
    ["<Tab>"] = { ":tabnext<Return>", "Next Tab" },
    ["<S-Tab>"] = { ":tabprev<Return>", "Previous Tab" },
    s = {
      name = "Window",
      s = { ":split<Return>", "Split Horizontal" },
      v = { ":vsplit<Return>", "Split Vertical" },
      h = { "<C-w>h", "Go to the left window " },
      j = { "<C-w>j", "Go to the down window" },
      k = { "<C-w>k", "Go to the up window" },
      l = { "<C-w>l", "Go to the right window" },
      q = { "<C-w>q", "Quit window" },
      r = {
        name = "resize",
        ["l"] = { "10<C-w>>", "Increase width" },
        ["h"] = { "10<C-w><", "Decrease width" },
        ["j"] = { "5<C-w>-", "Decrease Height" },
        ["k"] = { "5<C-w>+", "Increase Height" },
        ["e"] = { "<C-w>=", "Equally Height and wide" },
      },
    }
  }, opts_n )
end

return M
