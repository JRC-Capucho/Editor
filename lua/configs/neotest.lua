require("neotest").setup {
    adapters = {
        require "neotest-python" {
            dap = { justMyCode = false },
        },
        require "neotest-vitest",
        require "neotest-python",
        require "neotest-pest",
        require "neotest-go",
        require "neotest-jest",
    },
}

vim.keymap.set("n", "<leader>ts", function()
    require("neotest").summary.toggle()
end)
