local M = {}

local function setup_plugin_keymap(wk, plugin_name, opts)
    local ok, mod = pcall(require, plugin_name)
    if ok and mod.get_keymaps then
        wk.register(mod.get_keymaps(), opts)
    end
end


function M.setup()
    local wk = require("which-key")

    local leaderOpts = { prefix = "<leader>" }

    setup_plugin_keymap(wk, "config.lazy", leaderOpts)
    setup_plugin_keymap(wk, "config.dapui", leaderOpts)
end

return M
