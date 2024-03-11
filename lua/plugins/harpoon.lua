return {
  "ThePrimeagen/harpoon",
  lazy = true,
  config = function()
    local keymap = vim.keymap
    local harpoon_ui = require("harpoon.ui")
    local harpoon_mark = require("harpoon.mark")

    -- Harpoon keybinds --
    -- Open harpoon ui
    keymap.set("n", "<leader>ho", function()
      harpoon_ui.toggle_quick_menu()
    end, { desc = "Quick Menu" })

    -- Add current file to harpoon
    keymap.set("n", "<leader>ha", function()
      harpoon_mark.add_file()
    end, { desc = "Add File" })

    -- Remove current file from harpoon
    keymap.set("n", "<leader>hr", function()
      harpoon_mark.rm_file()
    end, { desc = "Rm file" })

    -- Remove all files from harpoon
    keymap.set("n", "<leader>hc", function()
      harpoon_mark.clear_all()
    end, { desc = "Clear all" })

    -- Quickly jump to harpooned files
    keymap.set("n", "<leader>1", function()
      harpoon_ui.nav_file(1)
    end, { desc = "Nav 1" })

    keymap.set("n", "<leader>2", function()
      harpoon_ui.nav_file(2)
    end, { desc = "Nav 2" })

    keymap.set("n", "<leader>3", function()
      harpoon_ui.nav_file(3)
    end, { desc = "Nav 3" })

    keymap.set("n", "<leader>4", function()
      harpoon_ui.nav_file(4)
    end, { desc = "Nav 4" })

    keymap.set("n", "<leader>5", function()
      harpoon_ui.nav_file(5)
    end, { desc = "Nav 5" })
  end
}
