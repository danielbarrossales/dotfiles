local M = {}

local pid = vim.fn.getpid()

local servers = {
	lua_ls = {
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
				client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT'
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							}
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
							-- library = vim.api.nvim_get_runtime_file("", true)
						}
					}
				})

				client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			end
			return true
		end
	},
	csharp_ls = {
		handlers = {
			["textDocument/definition"] = require('csharpls_extended').handler,
		},
		cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(pid) },
	},
}

function M.setup()
	local lspconfig = require 'lspconfig'
	local coq = require "coq"

	for server_name, settings in pairs(servers) do
		lspconfig[server_name].setup(coq.lsp_ensure_capabilities(settings))
	end

	vim.cmd('COQnow --shut-up')
end

return M
