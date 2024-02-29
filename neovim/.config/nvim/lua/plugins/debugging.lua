return {
    {
        "mfussenegger/nvim-dap",
        keys = function()
            local dap = require "dap"
            local dapui_widgets = require("dap.ui.widgets")
            return {
                { "<leader>dB", function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
                { "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
                { "<leader>dc", dap.continue, desc = "Continue" },
                { "<leader>da", function () dap.continue({ before = get_args }) end, desc = "Run with Args" },
                { "<leader>dC", dap.run_to_cursor, desc = "Run to Cursor" },
                { "<leader>dg", dap.goto_, desc = "Go to line (no execute)" },
                { "<leader>di", dap.step_into, desc = "Step Into" },
                { "<leader>dj", dap.down, desc = "Down" },
                { "<leader>dk", dap.up, desc = "Up" },
                { "<leader>dl", dap.run_last, desc = "Run Last" },
                { "<leader>do", dap.step_out, desc = "Step Out" },
                { "<leader>dO", dap.step_over, desc = "Step Over" },
                { "<leader>dp", dap.pause, desc = "Pause" },
                { "<leader>dr", dap.repl.toggle, desc = "Toggle REPL" },
                { "<leader>ds", dap.session, desc = "Session" },
                { "<leader>dt", dap.terminate, desc = "Terminate" },
                { "<leader>dw", dapui_widgets.hover, desc = "Widgets" },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        opts = {},
        keys = function()
            local dapui = require "dapui"
            return {
                { "<leader>dt", dapui.toggle, desc = "DAP UI Toggle" },
                { "<leader>de", dapui.eval, desc = "Eval", mode = {"n", "v"} }
            }
        end,
        config = function (_, opts)
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.enevt_exited["dapui_config"] = dapui.close
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
            automatic_installation = true,
            handlers = {},
            ensure_installed = {
            },
        },
    },
}
