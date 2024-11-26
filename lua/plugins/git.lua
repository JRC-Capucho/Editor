return {

	{
		"akinsho/git-conflict.nvim",
		version = "*",
		opts = {},
	},

	{

		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		keys = {
			{
				"<leader>gs",
				function()
					require("neogit").open()
				end,
			},
		},
		config = true,
	},

	{
		"pwntester/octo.nvim",
		cmd = "Octo",
		event = { { event = "BufReadCmd", pattern = "octo://*" } },
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- OR 'ibhagwan/fzf-lua',
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>gi", "<cmd>Octo issue list<CR>" },
			{ "<leader>gI", "<cmd>Octo issue search<CR>" },
			{ "<leader>gp", "<cmd>Octo pr list<CR>" },
			{ "<leader>gP", "<cmd>Octo pr search<CR>" },
			{ "<leader>gr", "<cmd>Octo repo list<CR>" },
			{ "<leader>gS", "<cmd>Octo search<CR>" },
		},
		opts = {
			enable_builtin = true,
			default_to_projects_v2 = true,
			default_merge_method = "squash",
			picker = "telescope",
		},
	},
}
