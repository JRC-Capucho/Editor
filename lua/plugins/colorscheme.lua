return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "main",      -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    })

    vim.cmd("colorscheme rose-pine")
    -- vim.cmd("colorscheme rose-pine-main")
    -- vim.cmd("colorscheme rose-pine-moon")
    -- vim.cmd("colorscheme rose-pine-dawn")
    vim.cmd("colorscheme rose-pine")
  end
}

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha",
--       background = {
--         light = "latte",
--         dark = "mocha",
--       },
--       transparent_background = true,
--       show_end_of_buffer = false,
--       term_colors = true,
--       dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--       },
--       no_italic = false,
--       no_bold = false,
--       no_underline = false,
--       styles =
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = { "italic" },
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--       },
--       color_overrides = {},
--       custom_highlights = {},
--       integrations = {
--         alpha = true,
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         notify = true,
--         mini = {
--           enabled = true,
--           indentscope_color = "",
--         },
--       },
--       native_lsp = {
--         enabled = true,
--         virtual_text = {
--           errors = { "italic" },
--           hints = { "italic" },
--           warnings = { "italic" },
--           information = { "italic" },
--         },
--         underlines = {
--           errors = { "underline" },
--           hints = { "underline" },
--           warnings = { "underline" },
--           information = { "underline" },
--         },
--         inlay_hints = {
--           background = true,
--         },
--       },
--       indent_blankline = {
--         enabled = true,
--         scope_color = "catppuccin", -- catppuccin color (eg. `lavender`) Default: text
--         colored_indent_levels = false,
--       },
--     })
--
--     vim.cmd([[colorscheme catppuccin-mocha]])
--   end,
-- }
