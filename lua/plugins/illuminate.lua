return {
	"RRethy/vim-illuminate",
	config = function()
		-- default configuration
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 100,
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"fugitive",
			},
			under_cursor = true,
			should_enable = function(bufnr)
				return true
			end,
			case_insensitive_regex = true,
		})
	end,
}
