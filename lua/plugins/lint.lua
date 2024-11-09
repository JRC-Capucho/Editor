return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			-- markdown = { "markdownlint" },
			dockerfile = { "hadolint" },
			php = { "phpcs" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()

				-- require("lint").try_lint("cspell")
			end,
		})
	end,
}
