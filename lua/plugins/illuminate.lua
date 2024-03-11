return {
  "RRethy/vim-illuminate",
  config = function()
    -- default configuration
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 100,
      filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
      },
      under_cursor = true,
      case_insensitive_regex = true,
    })
  end,
}
