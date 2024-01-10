local M = {}

function M.get_keymaps()
    local dapui = require "dapui"
    return {
        {
            keymaps = {
                d = {
                    name = "DAP UI",
                    t = { dapui.toggle, "DAP UI Toggle" }
                }
            }, opts = { prefix = "<leader>" }
        }
    }
end



function M.setup()
    require("dapui").setup()
end

return M

