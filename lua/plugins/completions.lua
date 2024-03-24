return {
	{
		"onsails/lspkind.nvim",
		lazy = true,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			-- vscode format
			require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
			require("luasnip.loaders.from_vscode").lazy_load({ paths = "your path!" })
			require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

			-- snipmate format
			require("luasnip.loaders.from_snipmate").load()
			require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

			-- lua format
			require("luasnip.loaders.from_lua").load()
			require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						preset = "default",
					}),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", option = { show_autosnippets = true } },
					{ name = "luasnip", option = { show_autosnippets = true } },
					{ name = "vim-dadbod-completion", option = { show_autosnippets = true } },
					{ name = "nvim_lua", option = { show_autosnippets = true } },
					{ name = "path", option = { show_autosnippets = true } },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"hrsh7th/cmp-cmdline",
		lazy = true,
		config = function()
			local cmp = require("cmp")
			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
}
