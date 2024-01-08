local M = {}

function M.setup()
    local treesitter_conf = require("nvim-treesitter.configs")
    treesitter_conf.setup({
        auto_install = true,
        highlight = {
            enable = true,
        }
    })
end

return M
