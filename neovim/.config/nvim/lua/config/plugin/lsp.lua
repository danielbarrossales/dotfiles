local M = {}

function M.setup()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
        ["<Space>"] = cmp.mapping.confirm({ select = false }),
        --["<C-Space>"] = cmp.mapping.complete(),
    })

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert(cmp_mappings),
        auto_select = false,
    })

    local wk = require("which-key")

    lsp.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions

        lsp.default_keymaps({buffer = bufnr})

        wk.register({
            ["gd"] = { vim.lsp.buf.definition, "Go to definition" },
            ["K"] = { vim.lsp.buf.hover, "Hover" },
            ["[d"] = { vim.diagnostic.goto_next, "Go to next" },
            ["]d"] = { vim.diagnostic.goto_prev, "Go to previous" },
        }, { buffer = bufnr, remap = false })

        wk.register({
            c = {
                name = "Code",
                ["ws"] = { vim.lsp.buf.workspace_symbol, "Workspace symbol" },
                ["of"] = { vim.lsp.diagnostic.open_float, "Open Float" },
                a = { vim.lsp.buf.code_action, "Code Action" },
                ["rr"] = { vim.lsp.buf.references, "References" },
                ["rn"] = { vim.lsp.buf.rename, "Rename" },
                h = { vim.lsp.buf.signature_help, "Signature Help" },
            }
        }, { buffer = bufnr, remap = false, prefix = "<leader>" })
    end)

    require('mason').setup({})

    require('mason-lspconfig').setup({
        -- Replace the language servers listed here 
        -- with the ones you want to install
        ensure_installed = {'tsserver', 'rust_analyzer', "lua_ls", "csharp_ls", "eslint" },
        handlers = {
            lsp.default_setup,
        },
    })

    lsp.setup()
end

return M
