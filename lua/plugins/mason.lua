return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"prisma-language-server",
			"lua-language-server",
			"typescript-language-server",
			"prettier",
			"eslint-lsp",
			"stylua",
			"shfmt",
			"bash-language-server",
			"json-lsp",
			"yaml-language-server",
			"sqlls",
			"html-lsp",
			"css-lsp",
		},
		ui = {
			icons = {
				package_pending = " ",
				package_installed = "󰄳 ",
				package_uninstalled = " 󰚌",
			},
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			if opts.ensure_installed and #opts.ensure_installed > 0 then
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end
		end, {})
		vim.g.mason_binaries_list = opts.ensure_installed
	end,
}
