return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = { "Neotree" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{ "\\", "<cmd>Neotree toggle<cr>" },
	},
	opts = {
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = "rounded",
		default_component_configs = {
			indent = {
				indent_marker = "│",
				last_indent_marker = "╰╴",
			},
			icon = {
				folder_closed = '',
				folder_open = '',
				folder_empty = '',
			},
			git_status = {
				symbols = {
					-- Change type
					added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted   = "✖", -- this can only be used in the git_status source
					renamed   = '➜', -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored   = '◌',
					unstaged  = '',
					staged    = '',
					conflict  = "",
				}
			},
		},
		window = {
			position = "right",
			width = 38,
		},
		filesystem = {
			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_hidden = true, -- only works on Windows for hidden files/directories
				hide_by_name = {
					"node_modules",
					"vendor",
					"\\.cache",
				},
				always_show_by_pattern = { -- uses glob style patterns
					".env*",
				},
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					".DS_Store",
					"thumbs.db"
				},
			},
		},
	},
}
