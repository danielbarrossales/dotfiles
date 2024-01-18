return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspservers = {
            lua_ls = {
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                workspace = {
                                    checkThirdParty = false,
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                            },
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end
            },
            vtsls = {},
            vuels = {},
            omnisharp = {},
        }

        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
        })

        local lspconfig = require 'lspconfig'
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for server_name, config in pairs(lspservers) do
            config.capabilities = capabilities
            lspconfig[server_name].setup(config)
        end
    end,
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = "williamboman/mason.nvim",
        },
        {
            "folke/neodev.nvim",
            config = function()
                require("neodev").setup({
                    library = { plugins = { "nvim-dap-ui" },
                    types = true },
                })
            end,
            dependencies = {
                "rcarriga/nvim-dap-ui"
            }
        },
        "hrsh7th/cmp-nvim-lsp",
    },
    keys = function ()
        return {
            { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Actions" },
            { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
            { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
            { "K", vim.lsp.buf.hover, desc = "Hover" },
            { "c-k", vim.lsp.buf.signature_help, desc = "Signature Help" },
        }
    end,
    lazy = false,
}
