require("lualine").setup {
  options = {
    theme = "rose-pine-alt",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_b = {
      {
        "branch",
        icon = "",
        -- added = "",
        -- changed = "",
        -- removed = "",
      },
      "filename",
      "navic",
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
    lualine_x = {
      "lsp_progress",
      {
        "diagnostics",
        symbols = {
          Error = " ",
          Warning = " ",
          Hint = "󰌶 ",
          Information = " ",
          Question = " ",
          Debug = " ",
          Ok = "󰧱 ",
        },
      },
      "fileformat",
      "filetype",
    },
    lualine_z = { "os.date('%I:%M')", "data", "require'lsp-status'.status()" },
  },
  extensions = { "quickfix", "trouble", "oil" },
}
