local M = {}

local function setup_plugin_keymap(wk, plugin_name)
    local ok, mod = pcall(require, "config." .. plugin_name)
    if ok and mod.get_keymaps then
        local keymaps_configs = mod.get_keymaps()
        for _, keymap_config in ipairs(keymaps_configs) do
            wk.register(keymap_config.keymaps, keymap_config.opts)
        end
    end
end


function M.setup()
    local wk = require("which-key")

    local plugins_configs = {
        "lazy",
        "dapui",
        "bufferline",
        "nvim-tree",
        "project",
        "telescope",
        "lsp"
    }

    for _, plugin_config in ipairs(plugins_configs) do
        setup_plugin_keymap(wk, plugin_config)
    end

end

return M
