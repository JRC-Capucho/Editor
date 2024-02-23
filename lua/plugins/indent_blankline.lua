return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = {
					char = "▏",
					priority = 2,
				},
				whitespace = {
					highlight = { "Whitespace", "NonText" },
				},
				scope = {
					show_start = true,
					show_end = true,
					show_exact_scope = true,
				},
			})
		end,
	},
}
