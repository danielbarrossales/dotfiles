local M = {}

function M.setup()
	local wk = require("which-key")
	-- As an example, we will create the following mappings:
	--  * <leader>ff find files
	--  * <leader>fr show recent files
	--  * <leader>fb Foobar
	-- we'll document:
	--  * <leader>fn new file
	--  * <leader>fe edit file
	-- and hide <leader>1
	vim.g.knap_settings = {
		texoutputext = "pdf",
    textopdf = "lualatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
    textopdfviewerlaunch = "evince %outputfile%",
    textopdfviewerrefresh = "kill -HUP %pid%"
	}

	local knap = require("knap");
	wk.register({
		f = {
			name = "file", -- optional group name
			f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
			n = { "New File" }, -- just a label. don't create any mapping
			e = "Edit File", -- same as above
			["1"] = "which_key_ignore",  -- special label to hide it in the popup
			b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
		},
		k = {
			name = "knap",
			p = { knap.process_once, "Process Once" },
			c = { knap.close_viewer, "Close Viewer" },
			t = { knap.toggle_autopreviewing, "Toggle Autopreviewing" },
			f = { knap.forward_jump, "Forward Jump" }
		}
	}, { prefix = "<leader>" })

end

return M
