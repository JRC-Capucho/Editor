return {
	"folke/lazydev.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "Bilal2453/luvit-meta" },
	opts = {
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
}
