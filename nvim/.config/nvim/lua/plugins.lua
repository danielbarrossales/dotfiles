local M = {}

PLUGINS = { 
	telescope = { enabled = true },
	fzf_lua = { enabled = false },
}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }


    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

		-- WhichKey
		use {
			 "folke/which-key.nvim",
			 config = function()
				 require("config.whichkey").setup()
			 end,
		}

		-- Status Line with Lualine
		use {
			"nvim-lualine/lualine.nvim",
			event = "VimEnter",
			config = function()
			 require("config.lualine").setup()
			end,
			requires = { "nvim-tree/nvim-web-devicons" },
		}

		use {
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			module = "nvim-gps",
			config = function()
				require("nvim-gps").setup()
			end,
		}

		use {
			"nvim-treesitter/nvim-treesitter",
			opt = true,
			event = "BufRead",
			 run = ":TSUpdate",
			 config = function()
				 require("config.treesitter").setup()
			 end,
			 requires = {
				{ "nvim-treesitter/nvim-treesitter-textobjects" },
			 }
		}
    -- Colorscheme
    use {
      "dracula/vim",
			after = "nvim-treesitter",
      config = function()
        vim.cmd [[ 
					colorscheme dracula 
					syntax on
				]]
      end,
    }

		-- File Explorer
		use {
		 "kyazdani42/nvim-tree.lua",
		 requires = {
			 "kyazdani42/nvim-web-devicons",
		 },
		 cmd = { "NvimTreeToggle", "NvimTreeClose" },
			 config = function()
				 require("config.nvimtree").setup()
			 end,
		}

		-- Fuzzy Find
		if PLUGINS.telescope.enabled then
			use {
				"nvim-telescope/telescope.nvim",
				opt = true,
				config = function()
					require("config.telescope").setup()
				end,
				cmd = { "Telescope" },
				module = "telescope",
				keys = { "<leader>f", "<leader>p" },
				wants = {
					"plenary.nvim",
					"popup.nvim",
					"telescope-fzf-native.nvim",
					"telescope-project.nvim",
					"telescope-repo.nvim",
					"telescope-file-browser.nvim",
					"project.nvim",
				},
				requires = {
					"nvim-lua/popup.nvim",
					"nvim-lua/plenary.nvim",
					{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
					"nvim-telescope/telescope-project.nvim",
					"cljoly/telescope-repo.nvim",
					"nvim-telescope/telescope-file-browser.nvim",
					{
						"ahmedkhalf/project.nvim",
						config = function()
							require("project_nvim").setup {}
						end,
					},
				},
			}
		end

		-- Auto pairs
		use {
			"windwp/nvim-autopairs",
			after="nvim-treesitter",
			event= "InsertEnter",
			config = function()
				require("config.autopairs").setup()
			end,
		}
		
		-- Auto tag
		use {
			"windwp/nvim-ts-autotag",
			wants = "nvim-treesitter",
			event = "InsertEnter",
			config = function()
				require("nvim-ts-autotag").setup { enable = true }
			end,
		}

		-- End wise
		use {
			"RRethy/nvim-treesitter-endwise",
			wants = "nvim-treesitter",
			event = "InsertEnter",
		}

		-- LSP
		use {
			"neovim/nvim-lspconfig",
			opt = true,
			event = "BufReadPre",
			wants = { "nvim-lsp-installer" },
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
			},
		}

		-- Completion
		use {
			"ms-jpq/coq_nvim",
			branch = "coq",
			event = "InsertEnter",
			opt = true,
			run = ":COQdeps",
			config = function()
				require("config.coq").setup()
			end,
			requires = {
				{ "ms-jpq/coq.artifacts", branch = "artifacts" },
				{ "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
			},
			disable = false,
		}

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
