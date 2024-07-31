return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        highlight_groups = {
          TelescopeBorder = { fg = "overlay", bg = "overlay" },
          TelescopeNormal = { fg = "subtle", bg = "overlay" },
          TelescopeSelection = { fg = "text", bg = "highlight_med" },
          TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
          TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "pine" },
          TelescopePreviewTitle = { fg = "base", bg = "iris" },

          TelescopePromptNormal = { fg = "text", bg = "surface" },
          TelescopePromptBorder = { fg = "surface", bg = "surface" },
        },
      }
      vim.cmd "colorscheme rose-pine"
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      local highlights = require "rose-pine.plugins.bufferline"
      require("bufferline").setup {
        options = {
          mode = "tabs",
        },
        highlights = highlights,
      }
    end,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "http",
        "graphql",
        "jsonc",
        "json",
        "jsonc",
        "vim",
        "sql",
        "lua",
        "vimdoc",
        "jsdoc",
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "yaml",
        "terraform",
        "hcl",
        "dockerfile",
        "c",
        "zig",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "regex",
        "bash",
        "ruby",
        "python",
        "ninja",
        "rst",
        "prisma",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 2,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "BurntSushi/ripgrep" },
    },
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "nvim-neotest/neotest",
    lazy = true,
    keys = {
      { "<leader>t", "", desc = "+test" },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run File",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Test Files",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true, auto_close = true }
        end,
        desc = "Show Output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand "%")
        end,
        desc = "Toggle Watch",
      },
    },

    dependencies = {
      "nvim-neotest/nvim-nio",
      "fredrikaverpil/neotest-golang",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec",
      "V13Axel/neotest-pest",
      "marilari88/neotest-vitest",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      require "configs.neotest"
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {},
    keys = {
      {
        "<leader>tt",
        function()
          require("trouble").open { mode = "diagnostics" }
        end,
      },
      {
        "[t",
        function()
          require("trouble").next { skip_groups = true, jump = true }
        end,
      },
      {
        "]t",
        function()
          require("trouble").prev { skip_groups = true, jump = true }
        end,
      },
    },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = { "tpope/vim-dadbod", cmd = "DB" },
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },
    init = function()
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_execute_on_save = false
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofumpt" },
        php = { "pint" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
        terraform = { "terraform_validate" },
        tf = { "terraform_validate" },
      },
    },
  },
  {
    "Exafunction/codeium.nvim",
    config = function()
      require("codeium").setup {
        enable_chat = true,
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
      require "configs.harpoon"
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "<leader>pv", ":Oil<cr>" },
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {
      file = {
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
        [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        [".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
        [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
        [".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
        ["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
        ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
    version = false,
    config = true,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
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
  {
    "NvChad/nvim-colorizer.lua",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = true,
      default_merge_method = "squash",
      picker = "telescope",
    },
    keys = {
      { "<leader>gi", "<cmd>Octo issue list<CR>", desc = "List Issues (Octo)" },
      { "<leader>gI", "<cmd>Octo issue search<CR>", desc = "Search Issues (Octo)" },
      { "<leader>gp", "<cmd>Octo pr list<CR>", desc = "List PRs (Octo)" },
      { "<leader>gP", "<cmd>Octo pr search<CR>", desc = "Search PRs (Octo)" },
      { "<leader>gr", "<cmd>Octo repo list<CR>", desc = "List Repos (Octo)" },
      { "<leader>gS", "<cmd>Octo search<CR>", desc = "Search (Octo)" },

      { "<leader>a", "", desc = "+assignee (Octo)", ft = "octo" },
      { "<leader>c", "", desc = "+comment/code (Octo)", ft = "octo" },
      { "<leader>l", "", desc = "+label (Octo)", ft = "octo" },
      { "<leader>i", "", desc = "+issue (Octo)", ft = "octo" },
      { "<leader>r", "", desc = "+react (Octo)", ft = "octo" },
      { "<leader>p", "", desc = "+pr (Octo)", ft = "octo" },
      { "<leader>v", "", desc = "+review (Octo)", ft = "octo" },
      { "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
      { "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },
    },
  },
  { "windwp/nvim-ts-autotag", opts = {} },
  { "kevinhwang91/nvim-bqf", ft = "qf", opts = {
    auto_enable = true,
    auto_resize_height = true,
  } },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "folke/zen-mode.nvim",
    opts = {},
    keys = {
      {
        "<leader>zz",
        function()
          require("zen-mode").setup {
            window = {
              width = 90,
              options = {},
            },
          }
          require("zen-mode").toggle()
          vim.wo.wrap = false
          vim.wo.number = true
          vim.wo.rnu = true
        end,
      },
      {
        "<leader>zZ",
        function()
          require("zen-mode").setup {
            window = {
              width = 80,
              options = {},
            },
          }
          require("zen-mode").toggle()
          vim.wo.wrap = false
          vim.wo.number = false
          vim.wo.rnu = false
          vim.opt.colorcolumn = "0"
        end,
      },
    },
  },
  { "folke/twilight.nvim", opts = {} },
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
      { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
      { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
      { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
    },
    config = function()
      require("kulala").setup {}
    end,
  },
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
  { "stevearc/dressing.nvim", opts = {} },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "letieu/harpoon-lualine",
      "arkav/lualine-lsp-progress",
    },
    config = function()
      require "configs.lualine"
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<C-\\>", "<cmd>Neotree toggle<cr>" },
    },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/nvim-cmp" },
      { "j-hui/fidget.nvim", opts = {} },
      { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
      { "rafamadriz/friendly-snippets" },
      { "kristijanhusak/vim-dadbod-completion" },
      { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
      { "roobert/tailwindcss-colorizer-cmp.nvim", opts = { color_square_width = 2 } },
      {
        "SmiteshP/nvim-navic",
        opts = {
          separator = " ",
          highlight = true,
          depth_limit = 5,
        },
      },
      {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        config = true,
      },
      {
        "petertriho/cmp-git",
        opts = {
          filetypes = { "gitcommit", "octo", "git_rebase", "NeogitCommitMessage" },
        },
      },
    },
    config = function()
      require "configs.lsp"
      require "configs.cmp"
    end,
  },
}
