local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

vim.keymap.set("n", "<leader>ha", mark.add_file,
                { desc = "Add file to harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu,
                { desc = "Toggle harpoon ui" })

vim.keymap.set({ "n", "i" }, "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set({ "n", "i" }, "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set({ "n", "i" }, "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set({ "n", "i" }, "<C-s>", function() ui.nav_file(4) end)

