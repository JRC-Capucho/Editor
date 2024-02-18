return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d",
				"prettierd",
				"stylua",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 5,
		})
	end,
}
