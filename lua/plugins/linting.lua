return {
	"mfussenegger/nvim-lint",
	lazy = false,
	init = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			typescript = { "eslint" },
			javascript = { "eslint" },
		}
	end,
}
