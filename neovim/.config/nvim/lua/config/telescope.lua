local M = {}

function M.setup()
    local telescope = require("telescope")
    telescope.setup()
    telescope.load_extension("projects")
end

function M.get_keymaps()
    local builtin =  require("telescope.builtin")
    local projects = require("telescope").extensions.projects.projects

    return {
        {
            keymaps = {
                f = {
                    name = "Find",
                    f = { builtin.find_files, "Find Files" },
                    g = { builtin.live_grep, "Live Grep" },
                    b = { builtin.buffers, "Buffers" },
                    h = { builtin.help_tags, "Help tags" },
                    p = { projects, "Projects" }
                },
            },
            opts = { prefix = "<leader>" },
        }
    }
end
return M
