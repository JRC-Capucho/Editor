return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
	branch = "0.1.x",
	keys = {
		{
			"<leader>pf",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({
					hidden = true,
				})
			end,
		},
		{
			"<leader>ps",
			function()
				local builtin = require("telescope.builtin")
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end,
			desc =
			"Search for a string in your current working directory and get results live as you type, respects .gitignore",
		},
		{
			"<leader>pt",
			function()
				local builtin = require("telescope.builtin")
				builtin.treesitter()
			end,
			desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
		},
		{
			"<leader>pws",
			function()
				local builtin = require("telescope.builtin")
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end,
		},
		{
			"<leader>pWs",
			function()
				local builtin = require("telescope.builtin")
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end,
		},
		{
			"<C-p>",
			function()
				local builtin = require("telescope.builtin")
				builtin.git_files({})
			end,
		},
		{
			"<leader>vh",
			function()
				local builtin = require("telescope.builtin")
				builtin.help_tags({})
			end,
		},
		{
			"<leader>pc",
			function()
				require("telescope").extensions.flutter.commands()
			end,
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"node_modules",
				"vendor",
				".git",
			},
			layout_strategy = "vertical", -- vertical layout
			sorting_strategy = "ascending",
			results_title = "",
			prompt_prefix = "  ", --  ›
			selection_caret = " › ",
			entry_prefix = "   ", -- each entry result prefix
			layout_config = {
				prompt_position = "top",
				width = 0.7,
				height = 0.6,
			},
			get_status_text = function(picker)
				local total = picker.stats.processed or 0
				local matches = total - (picker.stats.filtered or 0)

				if matches == 0 and total == 0 then
					return ""
				end

				return string.format("%s|%s ", matches, total)
			end,
		},
		pickers = {
			find_files = {
				previewer = false,
				layout_config = {
					prompt_position = "top",
					width = 0.6,
					height = 0.5,
				},
			},
			live_grep = {
				previewer = false,
				prompt_title = "Global Search",
				results_title = "", -- results
				layout_config = {
					prompt_position = "top",
					width = 0.7,
					height = 0.6,
				},
			},
			current_buffer_fuzzy_find = {
				previewer = false,
				prompt_title = "Search",
				results_title = "", -- results
				layout_config = {
					prompt_position = "top",
					width = 0.7,
					height = 0.6,
				},
			},
			buffers = {
				previewer = false,
				layout_config = {
					prompt_position = "top",
					width = 0.6,
					height = 0.5,
				},
			},
			git_bcommits = {
				previewer = false,
				layout_config = {
					prompt_position = "top",
					width = 0.7,
					height = 0.6,
				},
			},
			git_commits = {
				previewer = false,
				layout_config = {
					prompt_position = "top",
					width = 0.7,
					height = 0.6,
				},
			},
			git_status = {
				previewer = false,
				layout_config = {
					prompt_position = "top",
					width = 0.6,
					height = 0.5,
				},
			},
			git_branches = {
				previewer = false,
				layout_config = {
					prompt_position = "top",
					width = 0.6,
					height = 0.5,
				},
			},
			diagnostics = {
				previewer = false,
				prompt_title = "Diagnostics",
				layout_config = {
					prompt_position = "top",
					width = 0.6,
					height = 0.5,
				},
			},
		},
		extensions = {
			persisted = {
				layout_config = {
					prompt_position = "top",
					width = 0.6,
					height = 0.5,
				},
			},
		},
	},
}
