return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			max_concurrent_installers = 10,
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = {
			"MasonToolsInstall",
			"MasonToolsInstallSync",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
			"MasonToolsClean",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"markdownlint",
					"pint",
					"hadolint",
					"php-cs-fixer",
					"phpcs",
					"stylua",
					"blade-formatter",
				},
				auto_update = false,
				run_on_start = true,
				start_delay = 3000, -- 3 second delay
				debounce_hours = 5, -- at least 5 hours between attempts to install/update
				integrations = {
					["mason-lspconfig"] = true,
					-- ['mason-null-ls'] = true
					-- ['mason-nvim-dap'] = true,
				},
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "MasonToolsStartingInstall",
				callback = function()
					vim.schedule(function()
						print("mason-tool-installer is starting")
					end)
				end,
			})
		end,
	}
}
