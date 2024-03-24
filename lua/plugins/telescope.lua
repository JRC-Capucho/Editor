return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  keys = {
    {
      ';f',
      function()
        require 'telescope.builtin'.find_files()
      end
      ,
      desc = "Find File"
    },
    {
      ';r',
      function()
        require 'telescope.builtin'.live_grep()
      end
      ,
      desc = "Search Grep"
    },
    {
      ';;',
      function()
        require 'telescope.builtin'.buffers()
      end
      ,
      desc = "Last Search Mode"
    },
    {
      ';s',
      function()
        require 'telescope.builtin'.treesitter()
      end
      ,
      desc = "Search var, func etc..."
    },
  },
  dependencies = {
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
  end
}
