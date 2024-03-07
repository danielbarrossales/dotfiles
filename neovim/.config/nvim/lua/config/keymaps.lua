local M = {}

function M.setup()
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save File" })
    keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit Neovim" })

    -- Move to direction
    keymap.set( { "n", "t" }, "<C-h>", "<C-w>h", { desc = "Go to left window" })
    keymap.set( { "n", "t" }, "<C-j>", "<C-w>j", { desc = "Go to lower window" })
    keymap.set( { "n", "t" }, "<C-k>", "<C-w>k", { desc = "Go to upper window" })
    keymap.set( { "n", "t" }, "<C-l>", "<C-w>l", { desc = "Go to right window" })

    -- Clear selection
    keymap.set("n", "<leader>nh", "<CMD>nohl<CR>", { desc = "Clear selection"})

    -- When delete char, don't copy to register
    keymap.set("n", "x", '"_x')

    -- Increment/decrement
    keymap.set("n", "<LEADER>+", "<C-a>", { desc = "Increment"})
    keymap.set("n", "<LEADER>-", "<C-x>", { desc = "Decrement"})

    -- Window commands
    keymap.set("n", "<LEADER>sv", "<C-w>v", { desc = "Vertical split"})
    keymap.set("n", "<LEADER>sh", "<C-w>h", { desc = "Horizontal split"})
    keymap.set("n", "<LEADER>se", "<C-w>=", { desc = "Make split equal width"})
    keymap.set("n", "<LEADER>sx", "<CMD>close<CR>", { desc = "Close current split"})

    -- Tabs
    keymap.set("n", "<LEADER>to", "<CMD>tabnew<CR>", { desc = "Open new tab"})
    keymap.set("n", "<LEADER>tx", "<CMD>tabclose<CR>", { desc = "Close tab"})
    keymap.set("n", "<LEADER>tn", "<CMD>tabn<CR>", { desc = "Go to next tab"})
    keymap.set("n", "<LEADER>tp", "<CMD>tabp<CR>", { desc = "Go to previous tab"})
end
return M
