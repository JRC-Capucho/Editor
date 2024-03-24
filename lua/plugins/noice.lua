return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		lazy = false,
		opts = {
			render = "minimal",
			stages = "slide",
			timeout = 1000,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
			hover = {
				enabled = true,
				silent = false,
				view = nil,
				opts = {},
			},
		},
	},
}
