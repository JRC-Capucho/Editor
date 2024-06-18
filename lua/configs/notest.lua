require("neotest").setup {
    adapters = {
        require "neotest-python" {
            dap = { justMyCode = false },
        },
        require "neotest-plenary",
        require "neotest-vitest",
        require "neotest-python",
        require "neotest-pest",
        require "neotest-go",
        require "neotest-jest",
    },
}
