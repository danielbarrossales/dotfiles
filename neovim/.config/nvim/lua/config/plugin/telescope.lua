local M = {}

function M.setup()

end


function M.get_keymaps()
	local builtin = require('telescope.builtin')

	return {
		f = {
			name = "Find",
			f = { builtin.find_files, "Find Files" },
			g = { builtin.live_grep, "Live Grep" },
			i = { builtin.git_files, "Git Files" },
			b = { builtin.buffers, "Find Buffers" },
			h = { builtin.help_tags, "Help Tags" },
		}
	}
end

return M
