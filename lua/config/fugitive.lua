vim.keymap.set("n", "<leader>gs", function()
  require("neogit").open()
end)

local fugitive_group = vim.api.nvim_create_augroup("fugitive_group", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
  group = fugitive_group,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "neogit" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>p", function()
      require("neogit").open({ "push" })
    end, opts)

    -- rebase always
    vim.keymap.set("n", "<leader>P", function()
      require("neogit").op({ "pull" })
    end, opts)

    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
  end,
})

vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
