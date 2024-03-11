return {
  "akinsho/bufferline.nvim",
  lazy = true,
  keys = {
    { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  version = "*",
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    local bufferline = require("bufferline")

    bufferline.setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = { bg = "#000000" },
          },
          mocha = {
            background = { fg = mocha.text },
          },
          latte = {
            background = { fg = "#000000" },
          },
        },
      }),
      options = {
        mode = "tabs",
        themable = true,
        separator_style = "thick",
        offsets = {
          text_align = "center"
        },
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
      },
    })
  end,
}
