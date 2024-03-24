return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufWrite",
    lazy = true,
    keys = {
      {
        "<leader>hS",
        function()
          require "gitsigns".stage_buffer()
        end
        ,
        desc = "Stage buffer"
      },
      {
        "<leader>ha",
        function()
          require 'gitsigns'.stage_hunk()
        end
        ,
        desc = "Stage Hunk"
      },
      {
        "<leader>hu",
        function()
          require('gitsigns').undo_stage_hunk()
        end
        ,
        desc = "Undo Stage Hunk"
      },
      {
        "<leader>hR",
        function()
          require 'gitsigns'.reset_buffer()
        end
        ,
        desc = "Reset Buffer"
      },
      {
        "<leader>hp",
        function()
          require 'gitsigns'.preview_hunk()
        end
        ,
        desc = "Preview hunk"
      },
      {
        "<leader>hb",
        function()
          require 'gitsigns'.blame_line({ full = true })
        end,
        desc = "Blame line"
      },
      {
        "<leader>tb",
        function()
          require 'gitsigns'.toggle_current_line_blame()
        end,
        desc = "Toggle line Blame"
      },
      {
        "<leader>hd",
        function()
          require 'gitsigns'.diffthis()
        end,
        desc = "Diff"
      },
      {
        "<leader>hD",
        function()
          require 'gitsigns'.diffthis("~")
        end,
        desc = "Diff this"
      },
      {
        "<leader>td",
        function()
          require 'gitsigns'.toggle_deleted()
        end,
        desc = "Toggle Deleted"
      }
    },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      }
    }
  },
}
