return 
{
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    opts = {},
    keys = function()
        local dapui = require "dapui"
        return {
            { "<leader>dt", dapui.toggle, desc = "DAP UI Toggle" }
        }
    end
}
