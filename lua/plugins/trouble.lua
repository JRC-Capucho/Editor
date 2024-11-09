return {
	"folke/trouble.nvim",
	keys = {
		{
			"<leader>tt",
			function()
				local trouble = require "trouble"
				trouble.open { mode = "diagnostics" }
			end
		},
		{
			"[t", function()
			local trouble = require "trouble"
			trouble.next { skip_groups = true, jump = true }
		end
		},
		{
			"]t",
			function()
				local trouble = require "trouble"
				trouble.prev { skip_groups = true, jump = true }
			end

		}

	},
	opts = {
		icons = {
			indent = {
				middle = " ",
				last = " ",
				top = " ",
				ws = "│  ",
			},
		},
		modes = {
			diagnostics = {
				groups = {
					{ "filename", format = "{file_icon} {basename:Title} {count}" },
				},
			},
		},
	},
}
