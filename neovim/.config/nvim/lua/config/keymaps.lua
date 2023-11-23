local M = {}

function M.setup()
	local wk = require("which-key")
	local telescope_keys = require("config.plugin.telescope").get_keymaps()
	local lazy_keys = require("plugins").get_keymaps()

	wk.register({
		p = {
			name = "Project",
			e = { vim.cmd.Ex, "Directory Explore" },
		},
		telescope_keys,
		lazy_keys,
	}, { prefix = "<leader>" })
end

return M
