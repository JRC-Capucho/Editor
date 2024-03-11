return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
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
          require("telescope.themes").get_dropdown {}
        }
      },
    })

    require "telescope".load_extension("ui-select")
    require "telescope".load_extension("noice")
    require "telescope".load_extension("harpoon")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', ';f', builtin.find_files, { desc = "Find File" })
    vim.keymap.set('n', ';r', builtin.live_grep, { desc = "Search Grep" })
    vim.keymap.set('n', ';;', builtin.buffers, { desc = "Last Search Mode" })
    vim.keymap.set('n', ';s', builtin.treesitter, { desc = "Search var, func etc..." })
  end
}
