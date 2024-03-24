return {
	"nvimtools/none-ls.nvim",
  lazy = false,
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	keys = {
		{
			"<leader>cf",
			function()
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
				})
			end,
			desc = "Formatting",
		},
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				formatting.stylua,
        formatting.prettier,
				require("none-ls.diagnostics.eslint"),
--				require("none-ls.formatting.eslint"),
				require("none-ls.code_actions.eslint"),
			},
		})
	end,
}
