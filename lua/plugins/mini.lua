return {
	"echasnovski/mini.nvim",
	version = "*",
	lazy = false,
	config = function()
		require("mini.completion").setup({})
		require("mini.surround").setup({})
		require("mini.cursorword").setup({})
		require("mini.git").setup({})
		-- require("mini.notify").setup({})
		require("mini.pairs").setup({})
		require("mini.icons").setup({})
		require("mini.comment").setup({})
		require("mini.statusline").setup({})
		require("mini.tabline").setup({})
	end,
}
