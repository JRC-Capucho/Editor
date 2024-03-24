return {
  "numToStr/Comment.nvim",
  event = "InsertEnter",
  lazy = true,
  config = function()
    require("Comment").setup()
  end,
}
