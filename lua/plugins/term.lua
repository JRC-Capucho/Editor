return {
  'akinsho/toggleterm.nvim',
  keys = {
    { "<A-t>", "<cmd>ToggleTerm pos = 'sp' id = 'htoggleTerm' size = 0.3 <cr>", desc = "Terminal" }
  },
  config = function()
    local highlights = require('rose-pine.plugins.toggleterm')
    require('toggleterm').setup({ highlights = highlights })
  end
}
