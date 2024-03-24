return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp = require("lsp-zero")
			lsp.extend_lspconfig()
			lsp.preset("recommended")

			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({buffer = bufnr})
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local buffer = bufnr
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = buffer, desc = "Go to Declaration" })
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = buffer, desc = "Go to definition" })
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = buffer, desc = "Go to implementation" })
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = buffer, desc = "Signature Help" })
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = buffer, desc = "Add workspace Folder" })
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = buffer, desc = "Remove Workspace Folder" })
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, { buffer = buffer, desc = "List workspace folders" })
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = buffer, desc = "Type Definition" })
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = buffer, desc = "Code Action" })
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = buffer, desc = "References" })
				vim.keymap.set('n', '<space>f', function()
					vim.lsp.buf.format { async = true }
				end, { buffer = buffer, desc = "Format" })
			end)

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"eslint",
					"lua_ls",
					"jdtls",
					"rust_analyzer",
                    "texlab",
				},
				handlers = {
					lsp.default_setup,
				}
			})
			lsp.setup()
		end,
		dependencies = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{
				"folke/neodev.nvim",
				config = function()
					require("neodev").setup()
				end,
			},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},

			-- LSP Support
			{"neovim/nvim-lspconfig"},
			-- Autocompletion
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-nvim-lsp"},
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			{"L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
		}
	},
    {
        "frabjous/knap",
        init = function ()
            vim.cmd[[
            let g:knap_settings = {
                \ "textopdfviewerlaunch": "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
                \ "textopdfviewerrefresh": "none",
                \ "textopdfforwardjump": "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"
                \ }]]
            end
        },
    }
