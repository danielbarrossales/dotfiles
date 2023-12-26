local M = {}

local function setup_plugin_keymap(wk, plugin_name)
    local ok, mod = pcall(require, plugin_name)
    if ok and mod.get_keymaps then
        local keymap_config = mod.get_keymaps()
        wk.register(keymap_config.keymaps, keymap_config.opts)
    end
end


function M.setup()
    local wk = require("which-key")

    local plugins_configs = {
        "config.lazy",
        "config.dapui",
        "config.bufferline",
    }

    for _, plugin_config in ipairs(plugins_configs) do
        setup_plugin_keymap(wk, plugin_config)
    end

end

return M
