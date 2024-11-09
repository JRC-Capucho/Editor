return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "L3MON4D3/LuaSnip",            build = "make install_jsregexp" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-emoji" },
		{
			"petertriho/cmp-git",
			opts = {
				filetypes = {
					"gitcommit",
					"octo",
					"git_rebase",
					"NeogitCommitMessage",
				},
			},
		},
	},
	config = function()
		require("config.cmp")
	end,
}
