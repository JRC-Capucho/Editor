return {
	"neovim/nvim-lspconfig",
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

		lspconfig.yamlls.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})

		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		lspconfig.sqlls.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})

		lspconfig.bashls.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completefunctioncalls = true,
				},
			},
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completefunctioncalls = true,
				},
			},
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			settings = {
				completions = {
					completefunctioncalls = true,
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local map = vim.keymap.set

				map("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, silent = true, desc = "Hover" })
				map(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ buffer = ev.buf, silent = true, desc = "Code action" }
				)
				map("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Declaration", silent = true })
				map("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, silent = true, desc = "Definition" })
				map("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, silent = true, desc = "Implementation" })
				map("n", "J", vim.diagnostic.goto_next, { buffer = ev.buf, silent = true, desc = "Diagnostic" })
				map("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, silent = true, desc = "References" })
				vim.keymap.set("n", "<space>cf", function()
					vim.lsp.buf.format({ async = true })
				end, { buffer = ev.buf, silent = true, desc = "Format" })
			end,
		})
	end,
}
