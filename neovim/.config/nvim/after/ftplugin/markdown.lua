local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
local opts = { noremap=true, silent=false }

map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("v", "<leader>wzo", "<CMD>ZettelOpen<CR>", opts)
map("n", "<leader>wzi", "<CMD>ZettelInsert<CR>", opts)
map("n", "<leader>wzc", "<CMD>ZettelCapture<CR>", opts)
map("n", "<leader>wzb", "<CMD>ZettelBackLinks<CR>", opts)
map("n", "<leader>wzx", "<CMD>ZettelInbox<CR>", opts)
map("n", "<leader>wzl", "<CMD>ZettelGenerateLinks<CR>", opts)
map("n", "<leader>wzt", "<CMD>ZettelGenerateTags<CR>", opts)
map("n", "<LEADER>wzs", "<CMD>ZettelSearch<CR>", opts)
map("n", "<LEADER>wzy", "<CMD>ZettelYankName<CR>", opts)

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local function createZettel()
    local userInput = vim.fn.input('Enter title for new Zettel: ')
    vim.cmd('ZettelNew ' .. userInput)
end

vim.keymap.set("n", "<leader>wzn", createZettel, { desc = "Create new Zettel" })
