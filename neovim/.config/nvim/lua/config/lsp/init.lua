local M = {}

function M.setup()
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
end

function M.get_keymaps()
    local telescope = require("telescope.builtin");
    local reuse_win = { reuse_win = true }

    local inc_rename = require "inc_rename"
    return {
        {
            keymaps = {
                c = {
                    name = "Code",
                    a = { vim.lsp.buf.code_action, "Code Actions" },
                    l = { "<cmd>LspInfo<cr>", "Lsp Info" },
                },
            },
            opts = { prefix = "<leader>" }
        },
        {
            keymaps = {
                c = {
                    r = {
                        function ()
                            return ":" ..
                            inc_rename.config.cmd_name ..
                            " " ..
                            vim.fn.expand("<cword>")
                        end,
                        "Rename"
                    }
                }
            },
            opts = { prefix = "<leader>", expr = true }
        },
        {
            keymaps = {
                g = {
                    d = {
                        function()
                            telescope.lsp_definitions(reuse_win)
                        end,
                        "Goto Definition"
                    },
                    r = {
                        telescope.lsp_references, "References"
                    },
                    D = { vim.lsp.buf.declaration, "Goto Declaration" },
                    I = {
                        function ()
                            telescope.lsp_implementations(reuse_win)
                        end,
                        "Goto Implementations",
                    },
                    y = {
                        function ()
                            telescope.lsp_type_definitions(reuse_win)
                        end,
                        "Goto T[y]pe Definition"
                    },
                    K = { vim.lsp.buf.signature_help, "Signature Help" },
                },
                K = { vim.lsp.buf.hover, "Hover" },
            },
            opts = {}
        },
        {
            keymaps = {
                ['c-k'] = { vim.lsp.buf.signature_help, "Signature Help" },
            },
            opts = { mode = "i" },
        }
    }
end

return M
