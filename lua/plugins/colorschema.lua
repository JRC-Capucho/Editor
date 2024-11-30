--
return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	name = "rose-pine",
	config = function()
		vim.cmd.colorscheme("rose-pine")
	end,
}
--
-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require "gruvbox".setup {
-- 			transparent_mode = true,
-- 			contrast = "hard"
-- 		}
-- 		vim.o.background = "dark"
-- 		vim.cmd.colorscheme "gruvbox"
-- 	end
-- }
