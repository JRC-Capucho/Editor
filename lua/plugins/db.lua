return {
	"kristijanhusak/vim-dadbod-ui",
	cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
	dependencies = { "tpope/vim-dadbod", cmd = "DB" },
	keys = {
		{ "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
	},
	init = function()
		vim.g.db_ui_show_database_icon = true
		vim.g.db_ui_use_nerd_fonts = true
		vim.g.db_ui_execute_on_save = false
	end,
}
