local M = {}


function M.setup()
	local lint = require('lint')
	lint.linters_by_ft = {
		lua = { "luacheck" },
	}

	_G.tryLint = function()
		lint.try_lint()
	end

	vim.api.nvim_command("autocmd TextChanged <buffer> lua tryLint()")
	vim.api.nvim_command("autocmd InsertLeave <buffer> lua tryLint()")
end

return M
