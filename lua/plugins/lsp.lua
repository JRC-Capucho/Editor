return {
	"neovim/nvim-lspconfig",
	dependencies = { "lukas-reineke/lsp-format.nvim" },
	opts = {
		-- options for vim.diagnostic.config()
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		},
		inlay_hints = { enabled = false },
		codelens = { enabled = false },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})

		lspconfig.tsserver.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})

		lspconfig.prismals.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})
	end,
}
