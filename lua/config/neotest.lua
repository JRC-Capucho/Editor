local map = vim.keymap.set

local neotest = require "neotest"

neotest.setup {
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
