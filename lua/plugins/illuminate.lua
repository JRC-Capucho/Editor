return {
  "RRethy/vim-illuminate",
  event = "BufRead",
  lazy = true,
  config = function()
    require("illuminate").configure()
  end,
}
