return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  lazy = true,   -- enable lazy load
  ft = "norg",   -- lazy load on file type
  cmd = "Neorg", -- lazy load on command
  opts = {
    load = {
      ["core.defaults"] = {},  -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = {      -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
        },
      },
    },
  }
}
