return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
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
