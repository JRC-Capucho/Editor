require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"vimdoc",
		"javascript",
		"typescript",
		"go",
		"c",
		"lua",
		"rust",
		"vim",
		"jsdoc",
		"bash",
		"php",
		"html",
		"json",
		"markdown",
		"markdown_inline",
		"jsonc",
	},

	sync_install = false,

	auto_install = true,

	indent = {
		enable = true,
	},

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = { "markdown" },
	},
})

local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
treesitter_parser_config.templ = {
	install_info = {
		url = "https://github.com/vrischmann/tree-sitter-templ.git",
		files = { "src/parser.c", "src/scanner.c" },
		branch = "master",
	},
}

treesitter_parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
}

vim.treesitter.language.register("templ", "templ")
vim.treesitter.language.register("blade", "blade")
