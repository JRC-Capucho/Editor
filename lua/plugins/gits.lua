return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", {})
		end,
	},
  {
  'dinhhuy258/git.nvim',
    config = function ()
      require('git').setup()
      vim.keymap.set("n","<leader>gc",":Git commit<cr>",{})
    end
  }
}
