return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  lazy = true,
  opts = {
    options = {
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
      extensions = {
        'mason', 'lazy', 'toggleterm', "trouble"
      },
    },
    sections = {
      lualine_b = { "branch" },
      lualine_x = { 'filetype' }
    },
    theme = "rose-pine",
  }
}
