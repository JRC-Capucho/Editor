return {
  'stevearc/oil.nvim',
  config = function()
    require 'oil'.setup({
      float = {
        border = "rounded"
      },
      keymaps = {
        ["q"] = "actions.close"
      }
    })

  end
}
