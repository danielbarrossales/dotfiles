local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"neovim/nvim-lspconfig",
		config = require("config/lsp").setup,
		dependencies = {
			{
				"RishabhRD/nvim-lsputils",
				dependencies = { "RishabhRD/popfix" },
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason").setup()
					require("mason-lspconfig").setup { automatic_installation = true, }
				end,
				dependencies = {
					"williamboman/mason.nvim",
				},
			},
			{
				"ms-jpq/coq_nvim",
				branch = "coq",
				dependencies = {
					{
						"ms-jpq/coq.artifacts",
						branch = "artifacts",
					},
					{
						"ms-jpq/coq.thirdparty",
						branch = "3p",
					},
				},
			},
			{
				"Decodetalkers/csharpls-extended-lsp.nvim"
			},
		},
	},
	{ "mfussenegger/nvim-lint", config = require "config.nvim-lint".setup, },
	{ "frabjous/knap" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = require "config/which-key".setup,
		dependencies = { "frabjous/knap" },
	},
}
local opts = {}

function M.setup()
	require("lazy").setup(plugins, opts)
end

return M
