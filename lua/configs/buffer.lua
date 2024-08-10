local bufferline = require "bufferline"

-- local highlights = require "rose-pine.plugins.bufferline"

bufferline.setup {
  highlights = {
    fill = { bg = "none" },
    background = { bg = "none" },
    buffer_visible = { bg = "none" },
    buffer_selected = { bg = "none", bold = true, italic = true },
    modified = { fg = "none", bg = "none" },
    modified_visible = { fg = "none", bg = "none" },
    modified_selected = { bg = "none", fg = "none" },
    separator_selected = { bg = "none" },
    separator_visible = { bg = "none" },
    separator = { bg = "none" },
    indicator_visible = { bg = "none" },
    indicator_selected = { bg = "none" },
    offset_separator = { bg = "none" },
    close_button = { bg = "none" },
    close_button_visible = { bg = "none" },
    close_button_selected = { bg = "none" },
  },

  options = {
    mode = "buffers",
    style_preset = bufferline.style_preset.minimal,
    numbers = "none",
    indicator = {
      style = "none",
    },
    buffer_close_icon = " ",
    close_icon = " ",
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    separator_style = { "", "" },
  },
}
