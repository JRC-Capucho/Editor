require("lualine").setup {
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_b = {
      "branch",
      "filename",
      "navic",
      {
        "diagnostics",
        symbols = {
          error = "✘ ",
          warn = "▲ ",
          hint = "⚑ ",
          info = "» ",
        },
      },
    },
    lualine_c = {
      "%=", -- make the indicator center
      {
        "harpoon2",
        indicators = { "h", "t", "n", "s" },
        active_indicators = { "[H]", "[T]", "[N]", "[S]" },
        _separator = " ",
      },
    },
    lualine_x = { "lsp_progress", "filetype" },
    lualine_z = { "os.date('%I:%M')", "data", "require'lsp-status'.status()" },
  },
}
