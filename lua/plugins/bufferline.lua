return {
	"akinsho/bufferline.nvim",
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
	},
	version = "*",
	config = function()
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = "#000000" },
					},
					mocha = {
						background = { fg = mocha.text },
					},
					latte = {
						background = { fg = "#000000" },
					},
				},
			}),
			options = {
				mode = "tabs",
				separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		})
	end,
}
