vim.keymap.set("n", "tn", function()
    require("neotest").run.run()
end)

vim.keymap.set("n", "<leader>tf", function()
    require("neotest").run.run(vim.fn.expand "%")
end)

vim.keymap.set("n", "<leader>ts", function()
    require("neotest").summary.toggle()
end)

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
