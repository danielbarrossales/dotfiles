local M = {}

function M.setup()
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save File" })
    keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit Neovim" })

    -- Move to direction
    keymap.set( { "n", "t" }, "<C-h>", "<C-w>h", { desc = { "Go to left window" }})
    keymap.set( { "n", "t" }, "<C-j>", "<C-w>j", { desc = { "Go to lower window" }})
    keymap.set( { "n", "t" }, "<C-k>", "<C-w>k", { desc = { "Go to upper window" }})
    keymap.set( { "n", "t" }, "<C-l>", "<C-w>l", { desc = { "Go to right window" }})
end
return M
