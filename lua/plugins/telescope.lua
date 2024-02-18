return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = {
    {   'nvim-lua/plenary.nvim' },
    {'nvim-telescope/telescope-ui-select.nvim'},
  },
  config = function()
    require 'telescope'.setup({
      pickers = {
        find_files = {
          theme = "ivy",
        }
      },

      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown{}
        }
      },
    })

    require "telescope".load_extension("ui-select")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', ';f', builtin.find_files, {})
    vim.keymap.set('n', ';r', builtin.live_grep, {})
    vim.keymap.set('n', ';;', builtin.buffers, {})
    vim.keymap.set('n', ';s', builtin.treesitter, {})
  end
}
