vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Concatenate lines bellow keeping cursor inplace
vim.keymap.set("n", "J", "mzJ`z")

-- Move down and up half a page maintaining cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When moving on search tearms keeping cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


--
vim.keymap.set("n", "Q", "<nop>")
