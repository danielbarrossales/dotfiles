return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/Documents/neorg/notes/",
                    },
                    default_workspace = "notes"
                }
            },
            ["core.completion"] = {
                config = { engine = "nvim-cmp" },
            },
            ["core.summary"] = {},
            ["core.ui"] = {},
            ["core.ui.calendar"] = {}
        }
    },
    cmd = "Neorg",
}
