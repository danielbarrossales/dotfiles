local M = {}

function setup_plugin_keymap(wk, plugin_name, opts)
    local ok, mod = pcall(require, plugin_name)
    if ok and mod.keymaps then
        wk.register(mod.keymaps, opts)
    end
end


function M.setup()
    local wk = require("which-key")

    local leaderOpts = { prefix = "<leader>" }

    setup_plugin_keymap(wk, "config.lazy", leaderOpts)
end

return M
