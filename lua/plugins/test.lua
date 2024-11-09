return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"fredrikaverpil/neotest-golang",
		"nvim-neotest/neotest-jest",
		"nvim-neotest/neotest-python",
		"olimorris/neotest-rspec",
		"V13Axel/neotest-pest",
		"marilari88/neotest-vitest",
		"antoinemadec/FixCursorHold.nvim",
	},
	keys = {
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end
		},
		{
			"<leader>tT",
			function()
				require("neotest").run.run(vim.uv.cwd())
			end
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end
		},
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end
		}
	},
	config = function()
		local neotest = require "neotest"

		neotest.setup {
			adapters = {
				require "neotest-python" {
					dap = { justMyCode = false },
				},
				require "neotest-vitest",
				require "neotest-python",
				require "neotest-pest",
				require "neotest-golang",
				require "neotest-jest",
				require "neotest-rspec",
			},
		}
	end,
}
