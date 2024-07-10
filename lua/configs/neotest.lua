require("neotest").setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
    },
    require "neotest-vitest",
    require "neotest-python",
    require "neotest-pest",
    require "neotest-golang",
    require "neotest-jest",
    require "neotest-rspec",
  },
}

vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end)
