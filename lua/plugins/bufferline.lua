return {
	"akinsho/bufferline.nvim",
	event = "BufRead",
	lazy = true,
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
	},
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			themable = true,
			separator_style = "thick",
			offsets = {
				text_align = "center",
			},
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
		},
	},
	config = function()
		local highlights = require("rose-pine.plugins.bufferline")
		local buff = require("bufferline")
		buff.setup({ { highlights = highlights } })
	end,
}
