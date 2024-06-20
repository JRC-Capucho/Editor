local null_ls = require "null-ls"

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

null_ls.setup {
    sources = {
        --Lua
        formatting.stylua.with {
            filetypes = { "lua" },
        },
        formatting.prettier.with {
            filetypes = { "js", "ts" },
        },
        formatting.gofumpt.with {
            filetypes = { "go" },
        },
        formatting.goimports.with {
            filetypes = { "go" },
        },
        formatting.golines.with {
            filetypes = { "go" },
        },
        formatting.black.with {
            filetypes = { "py" },
        },
        formatting.isort.with {
            filetypes = { "py" },
        },
        code_actions.gitsigns,
        require "none-ls.diagnostics.eslint", -- requires none-ls-extras.nvim
    },
}
