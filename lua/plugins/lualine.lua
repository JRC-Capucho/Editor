return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "|",
				section_separators = { left = "", right = "" },
				theme = "everforest",
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "branch" },
				lualine_c = {},
				lualine_x = { "fileformat" },
				lualine_y = { "progress", "location" },
				lualine_z = {
					{
						"datetime",
						style = "%H:%M",
						separator = { right = "" },
						left_padding = 2,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
