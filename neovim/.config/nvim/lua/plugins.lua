local M = {}

function M.setup()
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
		"folke/which-key.nvim",
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.4',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
		"Mofiqul/dracula.nvim",
		{
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = require("config.plugin.treesitter").setup,
		},
		{
			'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
			config = require("config.plugin.lsp").setup,
			dependencies = {
				{'williamboman/mason.nvim'},
				{'williamboman/mason-lspconfig.nvim'},
				{'neovim/nvim-lspconfig'},
				{'hrsh7th/cmp-nvim-lsp'},
				{'hrsh7th/nvim-cmp'},
				{'L3MON4D3/LuaSnip'},
				{"folke/which-key.nvim"},
			}
		},
	}

	require("lazy").setup(plugins)
end

function M.get_keymaps()
	local lazy = require("lazy")
	return {
		z = {
			name = "Lazy",
			w = { lazy.show, "Show" },
			s = { lazy.sync, "Sync" },
			i = { lazy.install, "Install" },
			p = { lazy.profile, "Profile" },
			l = { lazy.log, "Log" }
		}
	}
end


return M
