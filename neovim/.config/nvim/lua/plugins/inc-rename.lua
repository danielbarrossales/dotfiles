return
{
    "smjonas/inc-rename.nvim",
    config = function()
        require("inc_rename").setup()
    end,
    keys = function()
        local inc_rename = require "inc_rename"
        return {
            {
                "<leader>cr",
                function ()
                    return ":" ..
                    inc_rename.config.cmd_name ..
                    " " ..
                    vim.fn.expand("<cword>")
                end,
                desc = "Rename",
                expr = true,
            },
        }
    end,
    lazy = false,
}
