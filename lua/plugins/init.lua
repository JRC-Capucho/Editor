return {
	{ "nvim-lua/plenary.nvim", lazy = false },

	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		-- ft = "markdown"

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"danymat/neogen",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("neogen").setup({})
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>ngc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>ngf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>ngt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		config = true,
	},

	{ "tpope/vim-sleuth",      lazy = false },

	{
		"folke/lazydev.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "Bilal2453/luvit-meta" },
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"ricardoramirezr/blade-nav.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		ft = { "blade", "php" },
		opts = {
			close_tag_on_complete = true,
		},
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				-- markdown = { "markdownlint" },
				dockerfile = { "hadolint" },
				php = { "phpcs" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()

					-- require("lint").try_lint("cspell")
				end,
			})
		end,
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = {
			"MasonToolsInstall",
			"MasonToolsInstallSync",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
			"MasonToolsClean",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"markdownlint",
					"pint",
					"hadolint",
					"php-cs-fixer",
					"phpcs",
					"stylua",
					"blade-formatter",
				},
				auto_update = false,
				run_on_start = true,
				start_delay = 3000, -- 3 second delay
				debounce_hours = 5, -- at least 5 hours between attempts to install/update
				integrations = {
					["mason-lspconfig"] = true,
					-- ['mason-null-ls'] = true
					-- ['mason-nvim-dap'] = true,
				},
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "MasonToolsStartingInstall",
				callback = function()
					vim.schedule(function()
						print("mason-tool-installer is starting")
					end)
				end,
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "pint" },
				blade = { "blade-formatter" },

				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},

	--
	-- {
	-- 	"rose-pine/neovim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("rose-pine")
	-- 	end,
	-- },

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require "gruvbox".setup {
				transparent_mode = true,
				contrast = "hard"
			}
			vim.o.background = "dark"
			vim.cmd.colorscheme "gruvbox"
		end

	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = { "Neotree" },
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "\\", "<cmd>Neotree toggle<cr>" },
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "right",
					width = 40,
				},
				buffers = {
					follow_current_file = {
						enabled = true,
					},
				},
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							"node_modules",
							"vendor",
						},
						never_show = {
							".DS_Store",
							"thumbs.db",
						},
					},
				},
			})
		end,
	},

	{
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
		config = function()
			require("config.neotest")
		end,
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		lazy = true,
		config = false,
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			max_concurrent_installers = 10,
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "L3MON4D3/LuaSnip",            build = "make install_jsregexp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-emoji" },
			{
				"petertriho/cmp-git",
				opts = {
					filetypes = {
						"gitcommit",
						"octo",
						"git_rebase",
						"NeogitCommitMessage",
					},
				},
			},
		},
		config = function()
			require("config.cmp")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("config.lsp")
		end,
	},

	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = true,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = {
					max_lines = 2,
				},
			},
		},
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.8",
		opts = {},
	},

	{
		"folke/trouble.nvim",
		opts = {},
	},

	{
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
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		keys = {
			{
				"<leader>gs",
				function()
					require("neogit").open()
				end,
			},
		},
		config = true,
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "BufNewfile", "BufReadPre" },
		opts = {},
	},

	{ "akinsho/git-conflict.nvim", version = "*", opts = {} },

	{
		"brenoprata10/nvim-highlight-colors",
		cmd = "HighlightColors",
		opts = {},
	},

	{
		"folke/zen-mode.nvim",
		dependencies = {
			{ "folke/twilight.nvim", opts = {} },
		},
		opts = {},
	},

	{
		"pwntester/octo.nvim",
		cmd = "Octo",
		event = { { event = "BufReadCmd", pattern = "octo://*" } },
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- OR 'ibhagwan/fzf-lua',
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			enable_builtin = true,
			default_to_projects_v2 = true,
			default_merge_method = "squash",
			picker = "telescope",
		},
	},
}
