local plugin = {
    {
        "nvimtools/none-ls.nvim",
        event = "User FilePost",
        dependencies = "nvimtools/none-ls-extras.nvim",
        config = function()
            require "configs.none"
        end,
    },
    --
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        opts = {},
    },
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    --
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- Lua
                "lua-language-server",
                "stylua",
                "bash-language-server",
                -- GO
                "gofumpt",
                "goimports",
                "golines",
                -- Docker
                "docker-compose-language-service",
                "dockerfile-language-server",
                "hadolint",
                -- Python
                "black",
                "isort",
                -- TS
                "prettier",
                "eslint-lsp",
                "pyright",
                "gopls",
                "prisma-language-server",
                "tailwindcss-language-server",
                "typescript-language-server",
                -- Terraform
                "terraform-ls",
            },
        },
    },
    {
        "Pocco81/TrueZen.nvim",
        lazy = false,
        cmd = { "TZAtaraxis", "TZMinimalist" },
        config = function()
            require "configs.truezen" -- just an example path
        end,
    },
    --
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                delete = { text = "󰍵" },
                change = { text = "│" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "│" },
            },
        },
    },
    --
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true,
            max_line = 1,
            line_numbers = true,
            mode = "topline",
        },
    },
    --
    { "folke/nvim-ts-autotag", config = true },
    --
    { "j-hui/fidget.nvim",     config = true },
    --
    {
        "folke/neodev.nvim",
        opts = {
            library = { plugins = { "neotest" }, types = true },
        },
    },
    --
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim", -- optional - Diff integration
            "ibhagwan/fzf-lua",       -- optional
        },
        keys = {
            {
                "<leader>gs",
                function()
                    require("neogit").open()
                end,
            },
        },
        config = true,
    },
    --
    --
    {
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
                lsp = {
                    signature = {
                        enabled = false,
                    },
                    hover = {
                        enabled = false,
                    },
                },
            },
            dependencies = {
                "MunifTanjim/nui.nvim",
                { "rcarriga/nvim-notify", opts = { render = "minimal" } },
            },
        },
    },
    --
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function()
            return require "configs.dashboard"
        end,
        config = function(_, opts)
            require("dashboard").setup(opts)
        end,
    },
    --
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            return require "configs.cmp"
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },
    --
    {
        "folke/which-key.nvim",
        enabled = false,
    },
    --
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
    },
    {
        "stevearc/conform.nvim",
        enabled = false,
    },
}


return {
    { 'nvim-lua/plenary.nvim' },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                -- defaults
                "vim",
                "lua",
                "vimdoc",
                "jsdoc",

                -- web dev
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "php",

                --yaml
                "yaml",
                -- terraform
                "terraform",
                --docker
                "dockerfile",
                -- low level
                "c",
                "zig",
                "go",
                "regex",
                "bash",
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        config = true,
        init = function()
            require 'configs.telescope'
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "moon",
            styles = {
                transparency = true,
            },
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
            vim.cmd.colorscheme('rose-pine-moon')
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim',          config = true },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
            { "onsails/lspkind.nvim" },
        },
        config = function()
            require "configs.lsp"
        end
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-jest",
            "nvim-neotest/neotest-python",
            "V13Axel/neotest-pest",
            "marilari88/neotest-vitest",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require "configs.neotest"
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            require 'configs.fugitive'
        end
    }
}
