local M = {}

function M.get_keymaps()
    local dapui = require "dapui"
    return {
        d = {
            name = "DAP UI",
            t = { dapui.toggle, "DAP UI Toggle" }
        }
    }
end



function M.setup()
    require("dapui").setup()
end

return M

