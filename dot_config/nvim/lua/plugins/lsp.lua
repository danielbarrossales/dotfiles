return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = 
				{
					"williamboman/mason.nvim",
					config = {
						ui = {
							icons = {
								package_installed = "✓",
								package_pending = "➜",
								package_uninstalled = "✗"
							}
						}
					}
				},
			},
			"ms-jpq/coq_nvim"
		}
	},
}
